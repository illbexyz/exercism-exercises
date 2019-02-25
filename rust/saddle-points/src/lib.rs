// Returns the specified column from a given matrix
fn get_column(matrix: &[Vec<u64>], column_index: usize) -> Option<Vec<u64>> {
    matrix
        .iter()
        .map(|row| {
            if row.len() > column_index {
                Some(row[column_index])
            } else {
                None
            }
        })
        .collect()
}

pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {
    // Example input:
    // [9, 8, 7]
    // [5, 3, 2]
    // [6, 6, 7]

    // (value = true if it's the maximum in it's row, false otherwise)
    // max_matrix = [
    //   [true,  false, false],
    //   [true,  false, false],
    //   [false, false, true ]
    // ]
    let max_matrix: Vec<Vec<bool>> = input
        .iter()
        .map(|row| {
            if let Some(max_in_row) = row.iter().max() {
                row.iter().map(|val| *val == *max_in_row).collect()
            } else {
                vec![]
            }
        })
        .collect();

    let column_mins: Vec<u64> = (0..input[0].len())
        .flat_map(|col_idx| get_column(input, col_idx))
        .map(|col| *col.iter().min().unwrap())
        .collect();

    // (value = true if it's the minimum in it's column, false otherwise)
    // min_matrix = [
    //   [false, false, false],
    //   [true,  true,  true ],
    //   [false, false, false]
    // ]
    let min_matrix: Vec<Vec<bool>> = input
        .iter()
        .map(|row| {
            row.iter()
                .zip(column_mins.iter())
                .map(|(val, column_min)| *val == *column_min)
                .collect()
        })
        .collect();

    // (max_matrix && min_matrix)
    // and_matrix = [
    //   [false, false, false],
    //   [true,  false, false],
    //   [false, false, false]
    // ]
    let and_matrix: Vec<Vec<bool>> = max_matrix
        .iter()
        .zip(min_matrix.iter())
        .map(|(row_max, row_min)| {
            row_max
                .iter()
                .zip(row_min.iter())
                .map(|(max_value, min_value)| *max_value && *min_value)
                .collect()
        })
        .collect();

    // (indexes of true values in and_matrix)
    // saddle_points = [(1, 0)]
    let mut saddle_points: Vec<(usize, usize)> = vec![];

    for (x, row) in and_matrix.iter().enumerate() {
        for (y, value) in row.iter().enumerate() {
            if *value {
                saddle_points.push((x, y))
            }
        }
    }

    saddle_points
}

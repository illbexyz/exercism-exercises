pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let non_zero_factors: Vec<u32> = factors
        .iter()
        .filter_map(|factor| match *factor {
            0 => None,
            _ => Some(*factor),
        })
        .collect();

    (1..limit)
        .into_iter()
        .filter(|curr| non_zero_factors.iter().any(|f| curr % f == 0))
        .sum()
}

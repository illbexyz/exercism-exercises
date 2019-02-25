use rayon::prelude::*;
use std::collections::HashSet;

fn is_pythagorean_triplet([a, b, c]: &[u32; 3]) -> bool {
    a.pow(2) + b.pow(2) == c.pow(2) && a < b && b < c
}

// a + b + c = sum
// => c = sum - a - b
//
// a^2 + b^2 = c^2
// => a^2 + b^2 = (sum - a - b)^2       [substitute c]
// => ...
// => b = (sum * (sum - (2 * a))) / (2 * (sum - a))
pub fn find(sum: u32) -> HashSet<[u32; 3]> {
    (1 .. (sum/3 + 1))
        .into_par_iter()
        .filter_map(|a| {
            // Given a and sum, we can calculate b and c
            let numerator = sum * (sum - (2 * a));
            let denominator = 2 * (sum - a);
            let b = numerator / denominator;
            let c = sum - a - b;
            let triplet = [a, b, c];

            if is_pythagorean_triplet(&triplet) {
                Some(triplet)
            } else {
                None
            }
        })
        .collect()
}

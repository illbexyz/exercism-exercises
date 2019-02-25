#![feature(test)]
extern crate test;

use pythagorean_triplet::find;
use std::{collections::HashSet, iter::FromIterator};
use test::Bencher;

fn process_tripletswithsum_case(sum: u32, expected: &[[u32; 3]]) {
    let triplets = find(sum);

    if !expected.is_empty() {
        let expected = HashSet::from_iter(expected.iter().cloned());

        assert_eq!(expected, triplets);
    } else {
        assert!(triplets.is_empty());
    }
}


#[bench]
fn bench_triplets_for_large_number(b: &mut Bencher) {
    b.iter(|| {
        process_tripletswithsum_case(
            30000,
            &[
                [1200, 14375, 14425],
                [1875, 14000, 14125],
                [5000, 12000, 13000],
                [6000, 11250, 12750],
                [7500, 10000, 12500],
            ],
        )
    });
}
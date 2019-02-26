#!/usr/bin/perl

use FindBin 1.51 qw($RealBin);
use lib $RealBin;

use poemSquire qw(:text);

open(my $poem, "<", "../poem.txt") or die("Can't open poem.txt.\nError: $!.");

my @poemLines = <$poem>;

close($poem) or die("Can't close poem.txt.\nError: $!.");

my $meaning;

foreach (@poemLines) {
  my @words = getWordsFromVerse($_);

  if ($words[1]) {
    print("=== Verse ===\n\n");

    print($_ . "\n\n");

    print("=== Glossary ===\n\n");

    foreach (@words) {
      $meaning = getWordMeaning($_);

      if ($meaning) {
        print($meaning . "\n");
      }
    }

    print("------------------------------\n\n");
  }
}

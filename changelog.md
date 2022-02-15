# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).


## [1.0 RC1] - 2022-02-15
This prerelease changes effective rules compared to 0.9 as follows:
- A critical failure causes the new "Lost Reaction" rule to take effect.
  - A critical failure prevents the "Change Stance" sub-rule of the "One of Each Type" optional rule from being used.
- A counter counts as a reaction and a character can only perform one reaction per round.
- Using the face value card's type (temporarily or swapping) uses a reaction.
- FIXED: Fix the "Check" rule outcome names to announce (in quotes) to match the list of outcomes
- FIXED: Fix use of "****" for both the "Unlimited" and "Save Wild" rules (now named instead).
  - The "Save Wild" rule not the "Unlimited" rule applied to the "Bribe" action.
- Add the "Incapacitated" rule to the Combo Table, and add it to certain actions.
  - Add the "Advantage" rule and a note to see the "Face Card" rule both to the "Determine Type and Value" rules.

### Added
- Add a "Example Card Arrangement" heading to reference the diagram more easily.
- Add a "Steps on Your Turn" heading to refer to the content more easily and describe the content better.
  - Leave only content that refers directly to the Combo Table in the "Combo Table" section.
  - Adjust table cell wording and font and column sizes so that the two sections still fit on one page.
- In the Combo Table section, clarify that "Increasing value never adds a type".
- Clarify the "Two Decks of Cards" rule by adding: "One deck becomes the draw pile and the other deck is used for dealing."
- Add the unstated "Static Type" rule as a new stated rule: "Increasing a value doesn't affect a pair's type*."
- "Using Jokers" optional rule doesn't change anything but clarifies the rule and clarifies that it is optional and must be known before starting.
- Add the "Incapacitated" rule to the combo table.


### Changed
- Make the backs of the cards on the "Example Card Arrangement" a lighter shade of blue so they aren't dark purple when printed on inkjet printers.
- Lighten instances of green in "Example Card Arrangement" by 50 Lightness (in GIMP "Hue-Saturation") for better inkjet printing.
- Add a tiny copy of the Combo Table as an image so that the table is legible in Markdown format (if post-processed by hand to use the full-size image).
- Make actions bold so they stand out on the Combo Table.
- Change "combo" to "another rule or combo" in the first (`*`) Combo Table caveat.
- Change rules version to "1.0 RC1".
- Name the "Two Decks of Cards" and "Counters" rules by underlining those.
- Put rule names in quotes when cited by the Combo Table caveats.
- Name the "Change Stance" sub-rule of the "One of Each Type" Optional Rule and clarify the wording to show .
- Rename the "Discard Attack Value Card" rule to "Discard the Action Value Card"
- Separate the "Face Cards" rule into "Face Card as Target Value" and "Face Card as Action Value" sub-rules for clarity and remove redundant and contradictory wording.
- For clarity, name the "Action" rule in the "Steps on Your Turn" section.
- For clarity, name the Combo table caveats instead of using multiple asterisks.

### Fixed
- Add the missing period after "even if the action is a surprise action".
- Explain the "Late Reaction" rule.
- Use the term "action" or "active" consistently instead of "attack".
- Change "health" to "vitality" for "Joker".
- Fix use of "****" for both the "Unlimited" and "Save Wild" rules (now named instead).
- Improve grammar where the 4 types are introduced.

### Removed
- unclear wording in "Steps on Your Turn" that are redundant to itself and to the "Check" rule subset.


## [git] - 2022-02-14
### Added
- readme files for navigating the repo using a web browser


## [0.9] - 2022-02-14
(git 2003f48)
### Added
- changelog
- Add a note regarding the named rules in the Combo Table section.
  - Before: https://github.com/poikilos/sixteencombos/raw/3256a9deab7a4f5c12ed1cdba78e9e50fd647724/documentation/Sixteen_Combos-Rules.odt
  - After: https://github.com/poikilos/sixteencombos/raw/2003f488d02e5b82b07537265f223d92b06218de/documentation/Sixteen_Combos-Rules.odt
  - Browse Before: https://github.com/poikilos/sixteencombos/tree/3256a9deab7a4f5c12ed1cdba78e9e50fd647724
  - Browse After: https://github.com/poikilos/sixteencombos/tree/2003f488d02e5b82b07537265f223d92b06218de
  - The above links were used to generate a diff (using commands upon which the new pre-stage.sh is based).
    The resulting diff for this commit is:

```diff
-opponent’s wealth that way (See “Scavenge” on the
-chart).
+opponent’s wealth that way (See “Scavenge” on the chart). Below are
+underlined steps for a turn.
```

### Changed
- Adjust the table column widths, font sizes, and wording to make the rules document 3 pages.
- From now on, a Markdown version (See the new odt-md folder) will be used to indicated differences in each version of the odt file instead of using xml. See an example of the clean diff using the Markdown method under "Added".

### Removed
- Due to this changelog, the xml (odt-extracted folder with xml cleaned by xmllint) has been purged from git history as per <https://stackoverflow.com/a/17824718/4541104>. The XML diff was unhelpful since LibreOffice Writer constantly changes many tag properties in the whole document such as style IDs even you only change one word, which was the case in commit a6722b6 ("Bump the version (date)"; actually changed one digit not a word per se) until git history was purged.


# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [git] - 2014-02-14
### Added
- readme files for navigating the repo using a web browser

## [git 2003f48] - 2014-02-14
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


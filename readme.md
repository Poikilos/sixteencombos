# 16 Combos
16 Combos is an *ultra-advanced* (:laughing:) card game such as for people who find regular card games repetitive. I invented this game while watching other people play various games that use playing cards. The games were uninspiring, so the game is mostly inspired by role-playing games :smile:. 16 Combos (16combos.com) by Poikilos (the author of [The Path of Resistance](https://zahyest.com)) is also a multi-player turn-based battle system using playing cards! You don't need a computer: 16 Combos has multiple dimensions of gameplay while requiring only playing cards and counters (such as coins, chips, bingo counters, or something on which to write numbers).

What makes the game interesting is that it isn’t just a game of “this number vs that number” like most card games. There can be 16 different actions depending on the combination of the attack and defense.

## Combo Table
The table is supposed to mimic real life: For example, if you use your vitality against someone’s wealth, you dig through the trash and try to overcome the opponent’s wealth that way (“Scavenge”). <ins>Static Type</ins>: Increasing a value doesn't affect a pair’s type `*`.
![Combo table (same table as in the documenation in text form)](documentation/images/combo-table.png)
`*`: Unless another combo or rule affects that.\
<ins>Once</ins>: You can’t get the effect of a two-turn action if you are using it as a second action but you can still cause damage or defeat. The second turn uses your reaction for the round.\
<ins>Limited</ins>: Use the “Maximum Value” rule.\
<ins>Passive</ins>: The target pair is neither damaged nor defeated/discarded*.\
<ins>Save Wild</ins>: Use the “Wild Card” rule.\
<ins>Surprise</ins>: Regardless of other rules or combos, the target can’t make changes to their target pair in any way after the action value is revealed (but they can do so on their “Predictive Reaction” but not their “Informed Reaction”).\
<ins>Unlimited</ins>: Ignore the “Maximum Value” rule.\
<ins>Incapacitated</ins>: On a “defeated” or “damaged” outcome, The target character can’t use an action nor reaction until their turn next round.

## Example Card Arrangement
![Drawing of the layout of the game on the table](documentation/images/table.png)

On Twitter, you an use [#16Combos](https://twitter.com/search?q=%2316combos&src=typed_query&f=top) and mention [@poikilos_](https://twitter.com/poikilos_) to spread the word.

## Rules
A printable copy of the rules is in the "[documentation](documentation/)" folder.

### Official vs Custom Rules
To prevent confusion (To ensure that players know the rules), the following rules usage is recommended:
- The behavior of an official game or application (any official computer code) should match the rules in the official rules document. If not, please report an issue (first ensuring it is not already an issue by searching for related terms using the search bar on the [Issues](https://github.com/poikilos/sixteencombos/issues) page--erase "open" then type then press enter to search for open and closed issues--if the issue is closed, you should try to update). The official rules document defines the official *ruleset*. The *ruleset name* includes the author and version/date and is on the top right of the document. Any changes to the intended gameplay should change the version rather than only the date. If there is a date and not a version, the version is 0.9.
- For unofficial rule documents or code, the documents or running program may use the official rules but should specify the complete ruleset name such as "Poikilos 2022-02-14" or whatever is at the top right corner of the version of the rules document you are using.
- If using custom rules, the document or running program should make clear to all users the custom ruleset name (title/author, and if necessary, the edition and/or version/date).
  - A custom ruleset's ruleset name must not be the same as the ruleset name (author+version/date) at the top right of the official rules document.
- In either case (following official or custom rules), the document or running program should also make clear to all users what optional rules are active before an encounter begins (such as in a welcome screen when joining the game or in a menu) if the ruleset has optional rules (The official rules contain optional rules).

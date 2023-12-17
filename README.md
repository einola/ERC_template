# LaTeX templates for ERC (CoG, 2024)

This repository contains LaTeX templates for the last ERC CoG call (2024). It consists of three files:

 1. erc.sty
 2. ERC_CoG_2024_B1_FINAL.tex
 3. ERC_CoG_2024_B2_FINAL.tex

The style file (erc.sty) contains the `erc` LaTeX package. This is used in the other two files, which are a reproduction of the official B1 and B2 templates. The user should pass either the option `b1` or `b2` to the package, depending on which of the documents (s)he is working on.

In addition to general formatting, then the style file also contains counters and commands for work packages (`\workpackage`) and tasks (`\task`), as well as reference commands (`\wpref` and `\tskref`). There are also counters and environments for objectives (`objective`), hypothesises (`hypothesis`), and research questions (`resq`). The environments have starred (`*`) alternatives which are not numbered. The number prefix can be changed by passing an alternative prefix to the environment.

The behaviour of the `\task` command is different depending on if the package receives the `b1` or `b2` option. In `b1` a `\task` must be within a `description` environment, while in `b2` `\task` stands alone.

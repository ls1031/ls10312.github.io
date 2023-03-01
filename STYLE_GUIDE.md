
This is a work in progress, but for now, we will aim to abide by it.

# General Policies

1. Small PRs: Google has a great explanation for why you should have small PRs (they call them CLs, but the same reasoning holds). You can read it [here](https://google.github.io/eng-practices/review/developer/small-cls.html).

2. Try to maintain a turnaround of no more than a few days on PR review: see `pr_policy.jpeg` for a concise explanation of the "deal" regarding PR size.

3. Unless it is literally the apocalypse, do not approve your own PRs.

4. Do not edit `main` directly. Create a branch, work on it, then merge it in. Then create another branch.

5. Test everything that isn't just drawing boxes on the screen. PRs should include unit tests.

# Style (The Ten Commandments)

This style guide is designed to do two things: (1) avoid common sources of bugs/inconveniences and (2) maintain a consistent style throughout the codebase. Reviewers may reject PRs for failing to comply with these style requirements.

1. Keep it simple, stupid. Make code as easy to understand as possible. **Prefer readability to writability. If your code makes me go "what the fuck?", you should rewrite it.**

2. Keep your code DRY and SOLID.

3. Keep methods small (≤10 lines is ideal). This applies to build methods too.

4. Everything should be `final` unless it absolutely must be mutable.

5. **Never** use the following keywords: `var`, `let`, `dynamic`. All variables must be strictly typed. <sub>(Small exceptions for JSON interface but we will get type safety when we shift to protobufs.)</sub>

6. There is almost never a reason to have a method with a `Widget` return type.

7. **No uninitialized variables, ever.** In objects, initialize all object members in the constructor.

8. All nontrivial literals should be `const` variables.

9. Encapsulate messy constructs. Specifically, this means a few things:
- Javascript calls should be wrapped in a function and only then called. Do not have your Dart code interop directly with JS.
- API calls and queries should be (and are) wrapped in functions. Do not have backend calls intermixed with frontend presentation.
- Async work should use a FutureBuilder.

10. Lines are 80 chars long and indents are 8 *spaces*. Do not use tabs for indentation unless you have configured your editor to insert spaces. If your expression is longer than 80 chars, add a line break.

# Conventions

*This section is under construction. We will figure out how to have naming conventions of our own without pissing off Flutter, because the Flutter style is a bit shitty.*


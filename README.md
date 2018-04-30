this was intended as a way to pre-fetch all the dependencies from a given tutorial so that it could be developed on localhost independent of a persistent network connection.

The original use case I was thinking of was commuting for 4 hours a day, which is prime dev time, but doesn't always have the best network connection.

However, after looking into it a bit, the following different scenarios seem to be necessary in being handled to get all the dependencies:

- find all links to source code, which may be specified in multiple ways, may point to github, or may not, and may be links to other source code that's not necessarily relevant to the tutorial.

- find all code tags in the document, and search through that for mentions of language-specific package terms (ie, for Ruby, search for 'gem' or 'Gemfile' or 'gem install').

- search through the text of the document to look for any mentions of language-specific package terms (ie, for Ruby, 'gem' or 'Gemfle' or 'gem install')

...and even then, this doesn't account for situations in which the content is dynamically generated via javascript, or when the tutorial is spread across multiple pages, and some of the necessary dependencies aren't mentioned until later pages (I'm looking at you https://www.railstutorial.org)

---

Current development has therefore stalled a bit until better ideas for how to handle all these different scenarios reveal themselves.

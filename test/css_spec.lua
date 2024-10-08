local d = require'plenary.strings'.dedent

local H = require'test.helpers'

local lang = 'css'

describe(lang, function()

  describe('block', function()

    H.make_suite(lang, '',
      d[[
        a { color: blue }
      ]],
      d[[
        a {
          color: blue;
        }
      ]],
      ':'
    )

    H.make_suite(lang, 'string containing sep',
      d[[
        a { content: ";" }
      ]],
      d[[
        a {
          content: ";";
        }
      ]],
      'c'
    )

    H.make_suite(lang, 'with list',
      d[[
        a { color: blue; font: 12px "Fira Code", monospace }
      ]],
      d[[
        a {
          color: blue;
          font: 12px "Fira Code", monospace;
        }
      ]],
      ';'
    )

    H.make_suite(lang, 'arguments',
      d[[
        :is(h1, h2, h3) { color: blue }
      ]],
      d[[
        :is(
          h1,
          h2,
          h3
        ) { color: blue }
      ]],
      '1'
    )

  end)

end)

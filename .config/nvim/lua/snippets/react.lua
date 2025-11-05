local ls = require "luasnip"

ls.add_snippets({
  javascriptreact = {
    ls.snippet("comp", {
      ls.text_node({ "<" }),
      ls.insert_node(1, "Component"),
      ls.text_node({ " " }),
      ls.insert_node(2, "props"),
      ls.text_node({ "={}" }),
      ls.text_node({ " />" }),
    }),
  },
  typescriptreact = {
    ls.snippet("comp", {
      ls.text_node({ "<" }),
      ls.insert_node(1, "Component"),
      ls.text_node({ " " }),
      ls.insert_node(2, "props"),
      ls.text_node({ "={}" }),
      ls.text_node({ " />" }),
    }),
  },
})

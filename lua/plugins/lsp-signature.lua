return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  config = function() 
      require("elaube.lsp-signature")
  end
}

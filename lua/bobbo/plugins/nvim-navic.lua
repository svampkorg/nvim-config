local status, navic = pcall(require, "nvim-navic")
if not status then
	return
end

navic.setup({
	on_attach = function(client, bufnr)
		if client.server.capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
	end,
})

local status, cheatsheet = pcall(require, "cheatsheet")
if not status then
	return
end

cheatsheet.setup({})

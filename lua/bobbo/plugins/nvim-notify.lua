local status, nvim_notify = pcall(require, "nvim-notify")
if not status then
	return
end

nvim_notify.setup()

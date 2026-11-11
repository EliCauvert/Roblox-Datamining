local Foundation = script:FindFirstAncestor("Foundation")
local LoggerModule = require(Foundation.Utility.Logger)
local _ = require(Foundation.Utility.Plugin.StudioUri)
local _ = require(Foundation.Components.Types)

return require(Foundation.Parent.React).createContext({
	anchor = nil,
	anchorUri = nil,
	isOpen = false,
	testId = "",
	setAnchor = function(_)
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("No PopoverProvider found for Popover")
	end,
	setAnchorUri = function(_)
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("No PopoverProvider found for Popover")
	end
})
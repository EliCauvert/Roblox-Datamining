return {
	Root = require(script.Popover),
	Anchor = require(script.Anchor),
	Content = if require(script:FindFirstAncestor("Foundation").Utility.Flags).FoundationPopoverPluginSupport then require(script.PopoverContentProxy) else require(script.Content)
}
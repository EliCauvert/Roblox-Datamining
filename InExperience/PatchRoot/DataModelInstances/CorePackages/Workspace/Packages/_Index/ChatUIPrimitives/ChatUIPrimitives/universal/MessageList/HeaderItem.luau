local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SizingModule = require(script.Parent.Sizing)
local _ = require(script.Parent.groupMessages)
local Context = ReactModule.createContext(nil)

return {
	Context = Context,
	Component = function(_)
		-- upvalues: ReactModule (copy), Context (copy), SizingModule (copy), FoundationModule (copy)
		return ReactModule.createElement(FoundationModule.View, {
			testId = "message-list-header",
			tag = FoundationModule.Hooks.useDefaultTags(SizingModule.useSizing().row.tag, "size-full-0 auto-y")
		}, { Header = ReactModule.useContext(Context) })
	end
}
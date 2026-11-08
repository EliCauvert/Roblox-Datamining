local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SizingModule = require(script.Parent.Parent.Parent.Sizing)

return function(p1)
	-- upvalues: SizingModule (copy), ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, { tag = SizingModule.useSizing().discussion.frameTag }, p1.children)
end
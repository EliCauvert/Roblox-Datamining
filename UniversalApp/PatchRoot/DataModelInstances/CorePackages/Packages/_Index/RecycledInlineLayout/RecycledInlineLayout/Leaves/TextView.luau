local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local Parent = RecycledInlineLayout.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RichTextModule = require(RecycledInlineLayout.Utils.RichText)
local TextBaseModule = require(RecycledInlineLayout.Leaves.TextBase)
local UseTestIdModule = require(RecycledInlineLayout.Utils.useTestId)

return ReactModule.memo(function(p1)
	-- upvalues: TextBaseModule (copy), FoundationModule (copy), UseTestIdModule (copy), ReactModule (copy), RichTextModule (copy)
	local FoundationPropsResult = TextBaseModule.foundationProps(p1, FoundationModule.Hooks.useTokens())
	FoundationPropsResult.Size = UDim2.fromScale(1, 1)
	local UseLineHeightResult = TextBaseModule.useLineHeight(p1.fontStyle)
	FoundationPropsResult.ref = UseLineHeightResult
	UseTestIdModule(p1.testId, { UseLineHeightResult })
	local JoinBindingsResult = ReactModule.joinBindings({ text = p1.Text, tags = p1.EngineTags, markup = p1.Markup })
	FoundationPropsResult.Text = JoinBindingsResult:map(function(p2)
		-- upvalues: RichTextModule (upval)
		return if p2.markup == nil then RichTextModule.format(p2.text or "", p2.tags) else p2.markup
	end)
	FoundationPropsResult.RichText = JoinBindingsResult:map(function(p2)
		-- upvalues: RichTextModule (upval)
		return p2.markup ~= nil or RichTextModule.hasTags(p2.tags)
	end)
	local StrokeStyle = p1.strokeStyle
	FoundationPropsResult.children = {
		Stroke = ReactModule.createElement("UIStroke", {
			Enabled = StrokeStyle:map(function(p2): boolean
				return p2 ~= nil
			end),
			Color = StrokeStyle:map(function(p2)
				return if p2 and p2.Color3 then p2.Color3 else Color3.new(0, 0, 0)
			end),
			Transparency = StrokeStyle:map(function(p2)
				return if p2 and p2.Transparency then p2.Transparency else 0
			end),
			Thickness = p1.strokeThickness:map(function(p2)
				return p2 or 1
			end)
		})
	}
	
	return ReactModule.createElement(FoundationModule.Text, FoundationPropsResult)
end)
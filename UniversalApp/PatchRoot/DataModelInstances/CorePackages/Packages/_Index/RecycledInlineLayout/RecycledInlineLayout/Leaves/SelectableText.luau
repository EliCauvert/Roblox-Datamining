local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local Parent = RecycledInlineLayout.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local ToolkitModule = require(RecycledInlineLayout.Toolkit)
local TextLeaf = ToolkitModule.TextLeaf

local function _(TextBox)
	if TextBox == nil then return end
	if TextBox:IsFocused() then
		TextBox:ReleaseFocus()
	end
	TextBox.SelectionStart = -1
	TextBox.CursorPosition = -1
end

local SelectableText, SelectableText2 = ToolkitModule.defineLeaf({
	name = "SelectableText",
	canForceSplit = true,
	view = ReactModule.memo(function(p1)
		-- upvalues: ReactModule (copy), ToolkitModule (copy), SignalsModule (copy), TextLeaf (copy), FoundationModule (copy)
		local UseRefResult = ReactModule.useRef(nil)
		local UseRecyclingAssignmentResult = ToolkitModule.Utils.useRecyclingAssignment()
		ReactModule.useLayoutEffect(function()
			-- upvalues: SignalsModule (upval), UseRecyclingAssignmentResult (copy), UseRefResult (copy)
			local Key = nil
			
			return SignalsModule.createEffect(function(p2)
				-- upvalues: UseRecyclingAssignmentResult (upval), Key (ref), UseRefResult (upval)
				local UseRecyclingAssignmentResultResult = UseRecyclingAssignmentResult(p2)
				local Key1 = if UseRecyclingAssignmentResultResult then UseRecyclingAssignmentResultResult.key else nil
				
				if Key1 == nil or Key ~= nil and Key1 ~= Key then
					local Current = UseRefResult.current
					
					if Current ~= nil then
						if Current:IsFocused() then
							Current:ReleaseFocus()
						end
						Current.SelectionStart = -1
						Current.CursorPosition = -1
					end
				end
				Key = Key1 or Key
			end)
		end, { UseRecyclingAssignmentResult })
		ToolkitModule.Utils.useTestId(p1.testId, { UseRefResult })
		local StylePropsResult = TextLeaf.styleProps(p1, FoundationModule.Hooks.useTokens())
		StylePropsResult.BackgroundTransparency = 1
		StylePropsResult.BorderSizePixel = 0
		StylePropsResult.Size = UDim2.fromScale(1, 1)
		StylePropsResult.Text = p1.Text
		StylePropsResult.TextEditable = false
		StylePropsResult.ClearTextOnFocus = false
		StylePropsResult.TextWrapped = false
		StylePropsResult.RichText = false
		StylePropsResult.ref = UseRefResult
		
		return ReactModule.createElement("TextBox", StylePropsResult)
	end),
	props = {
		Text = { layout = "split", delivery = "binding" },
		fontStyle = { layout = "measure", delivery = "binding" },
		SplitBy = { layout = "measure", delivery = "binding" },
		textStyle = { layout = "none", delivery = "binding" }
	},
	measure = TextLeaf.measure,
	split = TextLeaf.split,
	trimStart = TextLeaf.trimStart,
	trimEnd = TextLeaf.trimEnd
})

return {
	SelectableText = SelectableText,
	definition = SelectableText2
}
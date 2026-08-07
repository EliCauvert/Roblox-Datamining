local parent = script.Parent.Parent.Parent.Parent
local capturesCommonModule = require(parent.CapturesCommon)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local checkbox = foundationModule.Checkbox
local view = foundationModule.View
local getCropSize = capturesCommonModule.Utils.getCropSize

return function(p0) --[[ line: 20 ]]
	-- upvalues: reactModule (ref), view (ref), foundationModule (ref), checkbox (ref), getCropSize (ref)
	local var3, var4 = reactModule.useState(Vector2.new(0, 0))
	local var5 = reactModule.useRef(nil)
	local var6, var7 = reactModule.useState(Vector2.new(0, 0))
	local var8 = reactModule.useCallback(function() --[[ line: 25 ]]
		-- upvalues: p0 (ref)
		p0.updateSelected(not p0.isSelected)
	end, { p0.isSelected, p0.updateSelected })
	local var9 = reactModule.useCallback(function(p1) --[[ line: 29 ]]
		-- upvalues: var4 (ref)
		var4(p1.AbsoluteSize)
	end, {})
	local var10 = reactModule.useCallback(function(p2) --[[ line: 33 ]]
		-- upvalues: var5 (ref), var7 (ref)
		var5.current = p2
		var7(p2.Resolution)
	end, {})
	reactModule.useEffect(function() --[[ line: 38 ]]
		-- upvalues: var5 (ref)
		return function() --[[ line: 39 ]]
			-- upvalues: var5 (copy)
			if var5.current then
				var5.current.Video = ""
			end
		end
	end, {})
	local var11 = typeof(p0.content) == "Content" and (p0.content.Object ~= nil and p0.content.Object:IsA("VideoCapture"))
	
	return reactModule.createElement(view, { tag = "clip size-full", onAbsoluteSizeChanged = var9 }, {
		CheckboxOverlay = if p0.showCheckbox then reactModule.createElement(view, {
			tag = "size-full padding-small",
			ZIndex = 2,
			onActivated = var8,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			Checkbox = reactModule.createElement(checkbox, {
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				isChecked = p0.isSelected,
				onActivated = var8,
				Position = UDim2.fromScale(1, 0)
			})
		}) else nil,
		Image = if not var11 then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageContent = p0.content,
			Position = UDim2.fromScale(0.5, 0.5),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		}) else nil,
		Video = if var11 then reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Looped = true,
			Playing = true,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = getCropSize(var3, var6),
			VideoContent = p0.content,
			Volume = 0,
			[reactModule.Event.Loaded] = var10
		}) else nil
	})
end
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(profilePlatform.Common.Types)
local chip = foundationModule.Chip
local view = foundationModule.View
local uDim2 = UDim2.new(1, 0, 0, 32)

function ChipGroup(p1)
	-- upvalues: reactModule (ref), chip (ref), uDim2 (ref), view (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3, var4 = reactModule.useState(0)
	local var5, var6 = reactModule.useState(0)
	local var7, var8 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var8 (ref), var3 (ref), var5 (ref)
		if p1.scrollingEnabledOverride == nil then
			var8(var5 < var3)
			
			return
		end
		var8(p1.scrollingEnabledOverride)
	end, { var3, var5, p1.scrollingEnabledOverride })
	
	return if #p1.chips == 0 then nil else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = p1.size or uDim2
	}, {
		DynamicScrollingFrame = reactModule.createElement("ScrollingFrame", {
			ref = var1,
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			CanvasSize = p1.size or uDim2,
			ClipsDescendants = false,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ScrollingEnabled = var7,
			Selectable = false,
			Size = p1.size or uDim2,
			ZIndex = 1,
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2)
				-- upvalues: var6 (ref)
				var6(p2.AbsoluteSize.X)
			end, {})
		}, {
			ChipRow = reactModule.createElement(view, {
				tag = "row gap-small auto-y size-full-0",
				ref = var2,
				AutomaticSize = Enum.AutomaticSize.X,
				onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
					-- upvalues: var4 (ref)
					var4(p2.AbsoluteSize.X)
				end, {})
			}, table.unpack(reactModule.useMemo(function()
				-- upvalues: p1 (ref), reactModule (copy), chip (copy)
				local t = {}
				
				for i, v in ipairs(p1.chips) do
					t[i] = reactModule.createElement(chip, {
						isChecked = false,
						text = if v.count then `{v.count} {v.text}` else v.text,
						onActivated = v.onActivated,
						isDisabled = v.isDisabled or false,
						LayoutOrder = v.layoutOrder or i,
						size = v.size or "Medium",
						leading = v.leading,
						trailing = v.trailing
					})
				end
				return t
			end, { p1.chips })))
		})
	})
end

return ChipGroup
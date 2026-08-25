local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(profilePlatform.Common.Types)
local chip = foundationModule.Chip
local view = foundationModule.View
local uDim2 = UDim2.new(1, 0, 0, 32)

function ChipGroup(p0)
	-- upvalues: reactModule (ref), chip (ref), uDim2 (ref), view (ref)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6, var7 = reactModule.useState(0)
	local var8, var9 = reactModule.useState(0)
	local var10, var11 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var11 (ref), var6 (ref), var8 (ref)
		if p0.scrollingEnabledOverride == nil then
			var11(var8 < var6)
			
			return
		end
		var11(p0.scrollingEnabledOverride)
	end, { var6, var8, p0.scrollingEnabledOverride })
	
	return if #p0.chips == 0 then nil else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		Size = p0.size or uDim2
	}, {
		DynamicScrollingFrame = reactModule.createElement("ScrollingFrame", {
			ref = var4,
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			CanvasSize = p0.size or uDim2,
			ClipsDescendants = false,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ScrollingEnabled = var10,
			Selectable = false,
			Size = p0.size or uDim2,
			ZIndex = 1,
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p1)
				-- upvalues: var9 (ref)
				var9(p1.AbsoluteSize.X)
			end, {})
		}, {
			ChipRow = reactModule.createElement(view, {
				tag = "row gap-small auto-y size-full-0",
				ref = var5,
				AutomaticSize = Enum.AutomaticSize.X,
				onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
					-- upvalues: var7 (ref)
					var7(p2.AbsoluteSize.X)
				end, {})
			}, table.unpack(reactModule.useMemo(function()
				-- upvalues: p0 (ref), reactModule (copy), chip (copy)
				local t = {}
				
				for i, v in ipairs(p0.chips) do
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
			end, { p0.chips })))
		})
	})
end

return ChipGroup
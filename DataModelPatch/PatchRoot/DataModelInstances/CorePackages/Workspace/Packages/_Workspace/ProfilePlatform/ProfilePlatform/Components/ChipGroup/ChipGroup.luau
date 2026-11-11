local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(ProfilePlatform.Common.Types)
local Chip = FoundationModule.Chip
local View = FoundationModule.View
local _UDim2 = UDim2.new(1, 0, 0, 32)

function ChipGroup(p1)
	-- upvalues: ReactModule (copy), Chip (copy), _UDim2 (copy), View (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2_2 (copy), UseStateResult (copy), UseStateResult1 (copy)
		if p1.scrollingEnabledOverride == nil then
			UseStateResult2_2(UseStateResult1 < UseStateResult)
			
			return
		else
			UseStateResult2_2(p1.scrollingEnabledOverride)
		end
	end, {
		UseStateResult,
		UseStateResult1,
		p1.scrollingEnabledOverride
	})
	
	return if #p1.chips == 0 then nil else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = p1.size or _UDim2
	}, {
		DynamicScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			ref = UseRefResult,
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			CanvasSize = p1.size or _UDim2,
			ClipsDescendants = false,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ScrollingEnabled = UseStateResult3,
			Selectable = false,
			Size = p1.size or _UDim2,
			ZIndex = 1,
			[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame)
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(Frame.AbsoluteSize.X)
			end, {})
		}, {
			ChipRow = ReactModule.createElement(View, {
				tag = "row gap-small auto-y size-full-0",
				ref = UseRefResult1,
				AutomaticSize = Enum.AutomaticSize.X,
				onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(Frame.AbsoluteSize.X)
				end, {})
			}, table.unpack((ReactModule.useMemo(function()
				-- upvalues: p1 (copy), ReactModule (upval), Chip (upval)
				local Elements = {}
				
				for i, chip in ipairs(p1.chips) do
					Elements[i] = ReactModule.createElement(Chip, {
						isChecked = false,
						text = if chip.count then `{chip.count} {chip.text}` else chip.text,
						onActivated = chip.onActivated,
						isDisabled = chip.isDisabled or false,
						LayoutOrder = chip.layoutOrder or i,
						size = chip.size or "Medium",
						leading = chip.leading,
						trailing = chip.trailing
					})
				end
				return Elements
			end, { p1.chips }))))
		})
	})
end

return ChipGroup
local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local List = FoundationModule.List

local function _(Enabled): boolean
	-- upvalues: ReactModule (copy)
	if typeof(Enabled) ~= "table" or ReactModule.isValidElement(Enabled) then
		return Enabled ~= nil and Enabled ~= false
	end
	for _, value in Enabled do
		if value ~= false then
			return true
		end
	end
	return false
end

local _ = function(p1, p2)
	return if p1 then `{p1}--{p1}` else nil
end

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), ReactOtterModule (copy), IconName (copy), IconSize (copy), List (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local TestId = p1.testId
	local Children = p1.children
	local IsChildren = nil
	
	if typeof(Children) == "table" and not ReactModule.isValidElement(Children) then
		IsChildren = false
		
		for _, child in Children do
			if child ~= false then
				IsChildren = true
				break
			end
		end
	else
		IsChildren = Children ~= nil and Children ~= false
	end
	local Trailing = p1.trailing
	local IsTrailing = nil
	
	if typeof(Trailing) == "table" and not ReactModule.isValidElement(Trailing) then
		IsTrailing = false
		
		for _, value in Trailing do
			if value ~= false then
				IsTrailing = true
				break
			end
		end
	else
		IsTrailing = Trailing ~= nil and Trailing ~= false
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initiallyExpanded == true)
	local HasIsExpanded = p1.isExpanded ~= nil
	local IsIsExpanded = if HasIsExpanded then p1.isExpanded == true else UseStateResult
	local UseRefResult = ReactModule.useRef(IsIsExpanded)
	UseRefResult.current = IsIsExpanded
	
	local function toggle()
		-- upvalues: UseRefResult (copy), HasIsExpanded (copy), UseStateResult2 (copy), p1 (copy)
		local NoCurrent = not UseRefResult.current
		UseRefResult.current = NoCurrent
		
		if not HasIsExpanded then
			UseStateResult2(NoCurrent)
		end
		if p1.onExpandedChanged then
			p1.onExpandedChanged(NoCurrent)
		end
	end
	
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if IsIsExpanded then -180 else 0)
	ReactModule.useEffect(function()
		-- upvalues: IsIsExpanded (copy), UseAnimatedBindingResult2 (copy), ReducedMotion (copy), ReactOtterModule (upval), UseTokensResult (copy)
		local v1: number = if IsIsExpanded then -180 else 0
		UseAnimatedBindingResult2(if ReducedMotion then ReactOtterModule.instant(v1) else ReactOtterModule.ease(v1, {
			easingStyle = UseTokensResult.Ease.StandardOut,
			duration = UseTokensResult.Time.Time_300
		}))
	end, { IsIsExpanded, ReducedMotion, UseTokensResult })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = {
			["col size-full-0 auto-y"] = true,
			[p1.tag or ""] = p1.tag ~= nil
		},
		LayoutOrder = p1.layoutOrder
	}, {
		Row = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y expandable-list-item-row",
			LayoutOrder = 1,
			testId = if TestId then `{TestId}--row` else nil
		}, {
			Highlight = ReactModule.createElement(FoundationModule.View, {
				ZIndex = 0,
				tag = {
					["radius-medium expandable-list-item-highlight"] = true,
					["bg-shift-200"] = p1.isSelected == true
				},
				Position = UDim2.fromOffset(-UseTokensResult.Padding.Small, UseTokensResult.Padding.XSmall),
				Size = UDim2.new(1, UseTokensResult.Padding.Small * 2, 1, -UseTokensResult.Padding.XSmall * 2),
				testId = if TestId then `{TestId}--highlight` else nil
			}),
			Item = ReactModule.createElement(List.Item, {
				LayoutOrder = 1,
				title = p1.title or "",
				description = p1.description,
				leading = ReactModule.useMemo(function()
					-- upvalues: p1 (copy), IconName (upval)
					local LeadingIcon = p1.leadingIcon
					
					return if LeadingIcon == nil then nil else IconName[LeadingIcon] or { iconName = LeadingIcon }
				end, { p1.leadingIcon }),
				trailing = ReactModule.createElement(FoundationModule.View, { tag = "row align-y-center gap-xsmall auto-xy" }, {
					Actions = if IsTrailing then ReactModule.createElement(FoundationModule.View, {
						tag = "row align-y-center gap-xsmall auto-xy",
						LayoutOrder = 1
					}, p1.trailing) else nil,
					Toggle = if IsChildren then ReactModule.createElement(FoundationModule.View, {
						tag = "size-600-600 radius-small",
						LayoutOrder = 2,
						onActivated = toggle,
						testId = if TestId then `{TestId}--toggle` else nil
					}, {
						Chevron = ReactModule.createElement(FoundationModule.Icon, {
							name = IconName.ChevronSmallDown,
							size = IconSize.Large,
							Rotation = UseAnimatedBindingResult,
							testId = if TestId then `{TestId}--chevron` else nil
						})
					}) else ReactModule.createElement(FoundationModule.View, { tag = "size-600-600", LayoutOrder = 2 })
				}),
				input = FoundationModule.Enums.ListItemInputType.None,
				onActivated = p1.onActivated or (if IsChildren then toggle else nil),
				testId = TestId
			})
		}),
		Content = if IsChildren and IsIsExpanded then ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			padding = { left = UDim.new(0, UseTokensResult.Size.Size_300) }
		}, {
			List = ReactModule.createElement(List.Root, {
				hasDivider = false,
				size = p1.size or FoundationModule.Enums.InputSize.Medium,
				isContained = { isContained = false, hasMargin = false },
				testId = if TestId then `{TestId}--content` else nil
			}, p1.children)
		}) else nil
	})
end)
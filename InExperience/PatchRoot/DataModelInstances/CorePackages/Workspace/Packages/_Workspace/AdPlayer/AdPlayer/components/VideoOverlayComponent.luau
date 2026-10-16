local AdPlayer = script:FindFirstAncestor("AdPlayer")
local Parent = AdPlayer.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local FlagsModule = require(AdPlayer.Flags)
local Components = script:FindFirstAncestor("components")
local AdLabelComponentModule = require(Components.AdLabelComponent)
local LinearProgressComponentModule = require(Components.LinearProgressComponent)
local AdDropdownMenu = require(Parent.AdGuiInteractivity).AdDropdownMenu
local GetRewardInComponentModule = require(Components.GetRewardInComponent)
local AdDropdownButtonDefault = FlagsModule.GetAdDropdownButtonDefault()
local AdDropdownButtonOpen = FlagsModule.GetAdDropdownButtonOpen()
local AdPlayerExitButton = FlagsModule.GetAdPlayerExitButton()
local _Font = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

local function ExitButtonComponent(p1) --[[ Line: 30 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy), AdPlayerExitButton (copy)
	return ReactModule.createElement(View, {
		tag = "size-900 radius-circle",
		backgroundStyle = UseTokensFunction().Color.Common.Scrim,
		onActivated = p1.showExitConfirmationModal
	}, {
		icon = ReactModule.createElement(Image, {
			tag = "size-600 radius-circle position-center-center anchor-center-center",
			Image = AdPlayerExitButton
		})
	})
end

local function TimerComponent(p1) --[[ Line: 45 ]]
	-- upvalues: ReactModule (copy), Text (copy), _Font (copy)
	return ReactModule.createElement(Text, {
		tag = "size-0-500 auto-x content-emphasis",
		LayoutOrder = 2,
		Text = p1.alpha:map(function(p2: number): string --[[ Line: 49 ]]
			-- upvalues: p1 (copy)
			local Ceiled = math.ceil((1 - p2) * p1.totalDuration)
			
			return string.format("%02i:%02i", Ceiled // 60, Ceiled % 60)
		end),
		fontStyle = { FontSize = 14, Font = _Font }
	})
end

local function ScrimComponent(p1) --[[ Line: 63 ]]
	-- upvalues: UseTokensFunction (copy), ReactOtterModule (copy), ReactModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	ReactModule.useEffect(function() --[[ Line: 67 ]]
		-- upvalues: p1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if not p1.showScrim then
			local Flag = false
			task.delay(2, function() --[[ Line: 72 ]]
				-- upvalues: Flag (ref), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval)
				if not Flag then
					UseAnimatedBindingResult2(ReactOtterModule.spring(1))
				end
			end)
			
			return function() --[[ Line: 78 ]]
				-- upvalues: Flag (ref)
				Flag = true
			end
		end
		UseAnimatedBindingResult2(ReactOtterModule.instant(0))
		local Flag = nil
		
		return Flag
	end, { p1.showScrim })
	local Copy = table.clone(p1.children or {})
	Copy.scrim = ReactModule.createElement(View, {
		tag = "size-full",
		ZIndex = -1,
		backgroundStyle = UseTokensResult.Color.Common.Scrim
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		ZIndex = 0,
		GroupTransparency = UseAnimatedBindingResult
	}, Copy)
end

local function TopContainer(p1) --[[ Line: 100 ]]
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-1500 anchor-top-center position-top-center padding-x-medium padding-y-medium"
	}, p1.children)
end

local function BottomContainer(p1) --[[ Line: 106 ]]
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-700 anchor-bottom-center padding-x-medium",
		Position = UDim2.new(0.5, 0, 1, -24)
	}, p1.children)
end

local function BottomContainerListContainer(p1) --[[ Line: 113 ]]
	-- upvalues: FlagsModule (copy), ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		Position = if FlagsModule.GetEnableLuaRewardTimerUI() then UDim2.fromOffset(0, p1.yOffset or 0) else nil,
		tag = if FlagsModule.GetEnableLuaRewardTimerUI() then `size-full-500 row {if p1.isRightAligned then "align-x-right" else "align-x-left"} align-y-bottom gap-medium` else "size-full-500 row align-x-left align-y-center gap-medium"
	}, p1.children)
end

return (ReactModule.forwardRef(function(p2, p3) --[[ Line: 142 ]]
	-- upvalues: ReactModule (copy), UseTokensFunction (copy), View (copy), StateLayerAffordance (copy), BottomContainer (copy), AdDropdownMenu (copy), BottomContainerListContainer (copy), AdLabelComponentModule (copy), AdDropdownButtonOpen (copy), AdDropdownButtonDefault (copy), FlagsModule (copy), GetRewardInComponentModule (copy), ScrimComponent (copy), LinearProgressComponentModule (copy), TimerComponent (copy), TopContainer (copy), ExitButtonComponent (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseTokensResult = UseTokensFunction()
	
	local function dismissModals() --[[ Line: 147 ]]
		-- upvalues: p2 (copy), UseStateResult2 (copy)
		p2.setPaused(false)
		p2.dismissModals()
		UseStateResult2(false)
	end
	
	local function handleToggleAdsModal() --[[ Line: 153 ]]
		-- upvalues: p2 (copy), UseStateResult2 (copy), UseStateResult (copy)
		p2.setPaused(false)
		p2.dismissModals()
		UseStateResult2(false)
		
		if not UseStateResult then
			p2.setPaused(true)
			UseStateResult2(true)
		end
	end
	
	ReactModule.useImperativeHandle(p3, function() --[[ Line: 162 ]]
		-- upvalues: dismissModals (copy)
		return { dismissModals = dismissModals }
	end)
	ReactModule.useEffect(function() --[[ Line: 168 ]]
		-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy)
		if UseStateResult1 then
			UseStateResult2_1(false)
		end
	end, { UseStateResult1 })
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		onActivated = function() --[[ Line: 176 ]]
			-- upvalues: p2 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
			p2.setPaused(false)
			p2.dismissModals()
			UseStateResult2(false)
			UseStateResult2_1(true)
		end,
		stateLayer = { affordance = StateLayerAffordance.None }
	}, {
		persistentBottom = ReactModule.createElement(BottomContainer, {}, {
			adDropdownMenu = ReactModule.createElement(AdDropdownMenu, {
				transparency = 0.2,
				showDropDownMenu = UseStateResult,
				onWhyThisAdActivated = p2.showWhyThisAd,
				onReportAdActivated = p2.showReportAdModal,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromOffset(0, -UseTokensResult.Padding.Small)
			}),
			leftBottomListContainer = ReactModule.createElement(BottomContainerListContainer, {}, {
				adLabel = ReactModule.createElement(AdLabelComponentModule, {
					Image = if UseStateResult then AdDropdownButtonOpen else AdDropdownButtonDefault,
					handleToggleAdsModal = handleToggleAdsModal
				})
			}),
			rightBottomListContainer = if FlagsModule.GetEnableLuaRewardTimerUI() then ReactModule.createElement(BottomContainerListContainer, { isRightAligned = true, yOffset = -4 }, {
				getRewardInComponent = if p2.rewardWaitTime then ReactModule.createElement(GetRewardInComponentModule, {
					rewardWaitTime = p2.rewardWaitTime,
					rewardWaitAlpha = p2.rewardWaitAlpha
				}) else nil
			}) else nil
		}),
		scrim = ReactModule.createElement(ScrimComponent, {
			showScrim = UseStateResult or (p2.parentModalOpen or UseStateResult1)
		}, {
			fadingBottom = ReactModule.createElement(BottomContainer, {}, {
				progressBar = ReactModule.createElement(LinearProgressComponentModule, {
					alpha = p2.alpha,
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.fromScale(0.5, 1),
					AnchorPoint = Vector2.new(0.5, 1)
				}),
				bottomListContainer = ReactModule.createElement(BottomContainerListContainer, {}, {
					dummyAdLabel = ReactModule.createElement(AdLabelComponentModule, { Visible = false }),
					timer = ReactModule.createElement(TimerComponent, { alpha = p2.alpha, totalDuration = p2.totalDuration })
				})
			}),
			top = ReactModule.createElement(TopContainer, {}, {
				closeButton = ReactModule.createElement(ExitButtonComponent, { showExitConfirmationModal = p2.showExitConfirmationModal })
			})
		})
	})
end))
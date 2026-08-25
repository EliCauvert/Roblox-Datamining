local adPlayer = script:FindFirstAncestor("AdPlayer")
local parent = adPlayer.Parent
local reactModule = require(parent.React)
local adGuiInteractivityModule = require(parent.AdGuiInteractivity)
local reactOtterModule = require(parent.ReactOtter)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local flagsModule = require(adPlayer.Flags)
local components = script:FindFirstAncestor("components")
local adLabelComponentModule = require(components.AdLabelComponent)
local linearProgressComponentModule = require(components.LinearProgressComponent)
local adDropdownMenu = adGuiInteractivityModule.AdDropdownMenu
local getRewardInComponentModule = require(components.GetRewardInComponent)
local adDropdownButtonDefault = flagsModule.GetAdDropdownButtonDefault()
local adDropdownButtonOpen = flagsModule.GetAdDropdownButtonOpen()
local adPlayerExitButton = flagsModule.GetAdPlayerExitButton()
local font = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

local function ExitButtonComponent(p0)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), image (ref), adPlayerExitButton (ref)
	return reactModule.createElement(view, {
		tag = "size-900 radius-circle",
		backgroundStyle = useTokens().Color.Common.Scrim,
		onActivated = p0.showExitConfirmationModal
	}, {
		icon = reactModule.createElement(image, {
			tag = "size-600 radius-circle position-center-center anchor-center-center",
			Image = adPlayerExitButton
		})
	})
end

local function TimerComponent(p1)
	-- upvalues: reactModule (ref), text (ref), font (ref)
	return reactModule.createElement(text, {
		tag = "size-0-500 auto-x content-emphasis",
		LayoutOrder = 2,
		Text = p1.alpha:map(function(p2)
			-- upvalues: p1 (ref)
			local ceiled = math.ceil((1 - p2) * p1.totalDuration)
			
			return string.format("%02i:%02i", ceiled // 60, ceiled % 60)
		end),
		fontStyle = { FontSize = 14, Font = font }
	})
end

local function ScrimComponent(p3)
	-- upvalues: useTokens (ref), reactOtterModule (ref), reactModule (ref), view (ref)
	local var21 = useTokens()
	local var22, var23 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var23 (ref), reactOtterModule (copy)
		if p3.showScrim then
			var23(reactOtterModule.instant(0))
		else
			local var25 = false
			task.delay(2, function()
				-- upvalues: var25 (write), var23 (copy), reactOtterModule (copy)
				if not var25 then
					var23(reactOtterModule.spring(1))
				end
			end)
			
			return function()
				-- upvalues: var25 (write)
				var25 = true
			end
		end
		return nil
	end, { p3.showScrim })
	local cloned = table.clone(p3.children or {})
	cloned.scrim = reactModule.createElement(view, {
		tag = "size-full",
		ZIndex = -1,
		backgroundStyle = var21.Color.Common.Scrim
	})
	
	return reactModule.createElement(view, { tag = "size-full", ZIndex = 0, GroupTransparency = var22 }, cloned)
end

local function TopContainer(p4)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full-1500 anchor-top-center position-top-center padding-x-medium padding-y-medium"
	}, p4.children)
end

local function BottomContainer(p5)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full-700 anchor-bottom-center padding-x-medium",
		Position = UDim2.new(0.5, 0, 1, -24)
	}, p5.children)
end

local function BottomContainerListContainer(p6)
	-- upvalues: flagsModule (ref), reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		Position = if flagsModule.GetEnableLuaRewardTimerUI() then UDim2.fromOffset(0, p6.yOffset or 0) else nil,
		tag = if flagsModule.GetEnableLuaRewardTimerUI() then `size-full-500 row {if p6.isRightAligned then "align-x-right" else "align-x-left"} align-y-bottom gap-medium` else "size-full-500 row align-x-left align-y-center gap-medium"
	}, p6.children)
end

return reactModule.forwardRef(function(p7, p8)
	-- upvalues: reactModule (ref), useTokens (ref), view (ref), stateLayerAffordance (ref), BottomContainer (ref), adDropdownMenu (ref), BottomContainerListContainer (ref), adLabelComponentModule (ref), adDropdownButtonOpen (ref), adDropdownButtonDefault (ref), flagsModule (ref), getRewardInComponentModule (ref), ScrimComponent (ref), linearProgressComponentModule (ref), TimerComponent (ref), TopContainer (ref), ExitButtonComponent (ref)
	local var26, var27 = reactModule.useState(false)
	local var28, var29 = reactModule.useState(false)
	local var30 = useTokens()
	
	local function dismissModals()
		-- upvalues: p7 (ref), var27 (ref)
		p7.setPaused(false)
		p7.dismissModals()
		var27(false)
	end
	
	local function handleToggleAdsModal()
		-- upvalues: p7 (ref), var27 (ref), var26 (ref)
		p7.setPaused(false)
		p7.dismissModals()
		var27(false)
		
		if not var26 then
			p7.setPaused(true)
			var27(true)
		end
	end
	
	reactModule.useImperativeHandle(p8, function()
		-- upvalues: dismissModals (ref)
		return { dismissModals = dismissModals }
	end)
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), var29 (ref)
		if var28 then
			var29(false)
		end
	end, { var28 })
	
	return reactModule.createElement(view, {
		tag = "size-full",
		onActivated = function()
			-- upvalues: p7 (ref), var27 (ref), var29 (ref)
			p7.setPaused(false)
			p7.dismissModals()
			var27(false)
			var29(true)
		end,
		stateLayer = { affordance = stateLayerAffordance.None }
	}, {
		persistentBottom = reactModule.createElement(BottomContainer, {}, {
			adDropdownMenu = reactModule.createElement(adDropdownMenu, {
				transparency = 0.2,
				showDropDownMenu = var26,
				onWhyThisAdActivated = p7.showWhyThisAd,
				onReportAdActivated = p7.showReportAdModal,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromOffset(0, -var30.Padding.Small)
			}),
			leftBottomListContainer = reactModule.createElement(BottomContainerListContainer, {}, {
				adLabel = reactModule.createElement(adLabelComponentModule, {
					Image = if var26 then adDropdownButtonOpen else adDropdownButtonDefault,
					handleToggleAdsModal = handleToggleAdsModal
				})
			}),
			rightBottomListContainer = if flagsModule.GetEnableLuaRewardTimerUI() then reactModule.createElement(BottomContainerListContainer, { isRightAligned = true, yOffset = -4 }, {
				getRewardInComponent = if p7.rewardWaitTime then reactModule.createElement(getRewardInComponentModule, {
					rewardWaitTime = p7.rewardWaitTime,
					rewardWaitAlpha = p7.rewardWaitAlpha
				}) else nil
			}) else nil
		}),
		scrim = reactModule.createElement(ScrimComponent, { showScrim = var26 or (p7.parentModalOpen or var28) }, {
			fadingBottom = reactModule.createElement(BottomContainer, {}, {
				progressBar = reactModule.createElement(linearProgressComponentModule, {
					alpha = p7.alpha,
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.fromScale(0.5, 1),
					AnchorPoint = Vector2.new(0.5, 1)
				}),
				bottomListContainer = reactModule.createElement(BottomContainerListContainer, {}, {
					dummyAdLabel = reactModule.createElement(adLabelComponentModule, { Visible = false }),
					timer = reactModule.createElement(TimerComponent, { alpha = p7.alpha, totalDuration = p7.totalDuration })
				})
			}),
			top = reactModule.createElement(TopContainer, {}, {
				closeButton = reactModule.createElement(ExitButtonComponent, { showExitConfirmationModal = p7.showExitConfirmationModal })
			})
		})
	})
end)
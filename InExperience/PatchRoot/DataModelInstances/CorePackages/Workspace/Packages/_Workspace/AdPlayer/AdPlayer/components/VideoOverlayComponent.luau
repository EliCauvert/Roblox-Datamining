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

local function ExitButtonComponent(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), image (ref), adPlayerExitButton (ref)
	return reactModule.createElement(view, {
		tag = "size-900 radius-circle",
		backgroundStyle = useTokens().Color.Common.Scrim,
		onActivated = p1.showExitConfirmationModal
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

local function ScrimComponent(p1)
	-- upvalues: useTokens (ref), reactOtterModule (ref), reactModule (ref), view (ref)
	local var1 = useTokens()
	local var2, var3 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), reactOtterModule (copy)
		if p1.showScrim then
			var3(reactOtterModule.instant(0))
		else
			local var4 = false
			task.delay(2, function()
				-- upvalues: var4 (write), var3 (copy), reactOtterModule (copy)
				if not var4 then
					var3(reactOtterModule.spring(1))
				end
			end)
			
			return function()
				-- upvalues: var4 (write)
				var4 = true
			end
		end
		return nil
	end, { p1.showScrim })
	local cloned = table.clone(p1.children or {})
	cloned.scrim = reactModule.createElement(view, {
		tag = "size-full",
		ZIndex = -1,
		backgroundStyle = var1.Color.Common.Scrim
	})
	
	return reactModule.createElement(view, { tag = "size-full", ZIndex = 0, GroupTransparency = var2 }, cloned)
end

local function TopContainer(p1)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full-1500 anchor-top-center position-top-center padding-x-medium padding-y-medium"
	}, p1.children)
end

local function BottomContainer(p1)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full-700 anchor-bottom-center padding-x-medium",
		Position = UDim2.new(0.5, 0, 1, -24)
	}, p1.children)
end

local function BottomContainerListContainer(p1)
	-- upvalues: flagsModule (ref), reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		Position = if flagsModule.GetEnableLuaRewardTimerUI() then UDim2.fromOffset(0, p1.yOffset or 0) else nil,
		tag = if flagsModule.GetEnableLuaRewardTimerUI() then `size-full-500 row {if p1.isRightAligned then "align-x-right" else "align-x-left"} align-y-bottom gap-medium` else "size-full-500 row align-x-left align-y-center gap-medium"
	}, p1.children)
end

return reactModule.forwardRef(function(p2, p3)
	-- upvalues: reactModule (ref), useTokens (ref), view (ref), stateLayerAffordance (ref), BottomContainer (ref), adDropdownMenu (ref), BottomContainerListContainer (ref), adLabelComponentModule (ref), adDropdownButtonOpen (ref), adDropdownButtonDefault (ref), flagsModule (ref), getRewardInComponentModule (ref), ScrimComponent (ref), linearProgressComponentModule (ref), TimerComponent (ref), TopContainer (ref), ExitButtonComponent (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	local var5 = useTokens()
	
	local function dismissModals()
		-- upvalues: p2 (ref), var2 (ref)
		p2.setPaused(false)
		p2.dismissModals()
		var2(false)
	end
	
	local function handleToggleAdsModal()
		-- upvalues: p2 (ref), var2 (ref), var1 (ref)
		p2.setPaused(false)
		p2.dismissModals()
		var2(false)
		
		if not var1 then
			p2.setPaused(true)
			var2(true)
		end
	end
	
	reactModule.useImperativeHandle(p3, function()
		-- upvalues: dismissModals (ref)
		return { dismissModals = dismissModals }
	end)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var4 (ref)
		if var3 then
			var4(false)
		end
	end, { var3 })
	
	return reactModule.createElement(view, {
		tag = "size-full",
		onActivated = function()
			-- upvalues: p2 (ref), var2 (ref), var4 (ref)
			p2.setPaused(false)
			p2.dismissModals()
			var2(false)
			var4(true)
		end,
		stateLayer = { affordance = stateLayerAffordance.None }
	}, {
		persistentBottom = reactModule.createElement(BottomContainer, {}, {
			adDropdownMenu = reactModule.createElement(adDropdownMenu, {
				transparency = 0.2,
				showDropDownMenu = var1,
				onWhyThisAdActivated = p2.showWhyThisAd,
				onReportAdActivated = p2.showReportAdModal,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromOffset(0, -var5.Padding.Small)
			}),
			leftBottomListContainer = reactModule.createElement(BottomContainerListContainer, {}, {
				adLabel = reactModule.createElement(adLabelComponentModule, {
					Image = if var1 then adDropdownButtonOpen else adDropdownButtonDefault,
					handleToggleAdsModal = handleToggleAdsModal
				})
			}),
			rightBottomListContainer = if flagsModule.GetEnableLuaRewardTimerUI() then reactModule.createElement(BottomContainerListContainer, { isRightAligned = true, yOffset = -4 }, {
				getRewardInComponent = if p2.rewardWaitTime then reactModule.createElement(getRewardInComponentModule, {
					rewardWaitTime = p2.rewardWaitTime,
					rewardWaitAlpha = p2.rewardWaitAlpha
				}) else nil
			}) else nil
		}),
		scrim = reactModule.createElement(ScrimComponent, { showScrim = var1 or (p2.parentModalOpen or var3) }, {
			fadingBottom = reactModule.createElement(BottomContainer, {}, {
				progressBar = reactModule.createElement(linearProgressComponentModule, {
					alpha = p2.alpha,
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.fromScale(0.5, 1),
					AnchorPoint = Vector2.new(0.5, 1)
				}),
				bottomListContainer = reactModule.createElement(BottomContainerListContainer, {}, {
					dummyAdLabel = reactModule.createElement(adLabelComponentModule, { Visible = false }),
					timer = reactModule.createElement(TimerComponent, { alpha = p2.alpha, totalDuration = p2.totalDuration })
				})
			}),
			top = reactModule.createElement(TopContainer, {}, {
				closeButton = reactModule.createElement(ExitButtonComponent, { showExitConfirmationModal = p2.showExitConfirmationModal })
			})
		})
	})
end)
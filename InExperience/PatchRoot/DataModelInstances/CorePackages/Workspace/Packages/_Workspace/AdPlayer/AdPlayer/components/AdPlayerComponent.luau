local runService = game:GetService("RunService")
local adPlayer = script:FindFirstAncestor("AdPlayer")
local parent = adPlayer.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useTokens = foundationModule.Hooks.useTokens
local reportAdPopup = require(parent.AdGuiInteractivity).ReportAdPopup
local components = adPlayer.components
local videoOverlayComponentModule = require(components.VideoOverlayComponent)
local exitConfirmationModalComponentModule = require(components.ExitConfirmationModalComponent)
local flagsModule = require(adPlayer.Flags)
local frozen = table.freeze({ Loading = 1, Paused = 2, Playing = 3 })

return function(p1)
	-- upvalues: flagsModule (ref), useTokens (ref), reactModule (ref), frozen (ref), runService (ref), components (ref), view (ref), stateLayerAffordance (ref), exitConfirmationModalComponentModule (ref), reportAdPopup (ref), videoOverlayComponentModule (ref)
	local enableLuaRewardTimerUI = flagsModule.GetEnableLuaRewardTimerUI()
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(0)
	local var4, var5 = reactModule.useBinding(0)
	local var6 = nil
	local var7 = nil
	
	if enableLuaRewardTimerUI then
		local var8, var9 = reactModule.useBinding(0)
		var6 = var8
		var7 = var9
	end
	local var10, var11
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(frozen.Loading)
	local _ = nil
	local _ = nil
	
	if enableLuaRewardTimerUI then
		var10 = reactModule.createRef()
		var11 = reactModule.createRef()
	else
		var10 = reactModule.useRef(nil)
		var11 = reactModule.useRef(nil)
	end
	local durationNeededForReward = p1.durationNeededForReward
	
	local function dismissParentModals()
		-- upvalues: var13 (ref), var15 (ref)
		var13(false)
		var15(false)
	end
	
	local function _()
		-- upvalues: var13 (ref), var15 (ref), enableLuaRewardTimerUI (ref), var10 (write)
		var13(false)
		var15(false)
		local var18 = if enableLuaRewardTimerUI then var10.current else var10:getValue()
		
		if var18 then
			var18.dismissModals()
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: enableLuaRewardTimerUI (ref), var11 (write), var17 (ref), frozen (copy), var3 (ref), p1 (ref), runService (copy), var5 (ref), durationNeededForReward (ref), var7 (write)
		local var18 = if enableLuaRewardTimerUI then var11.current else var11:getValue()
		
		if not var18.IsLoaded then
			var18.Loaded:Wait()
		end
		var17(frozen.Playing)
		var3(var18.TimeLength)
		var18.Ended:Connect(p1.onComplete)
		local renderSteppedConnection = runService.RenderStepped:Connect(function()
			-- upvalues: var18 (write), var5 (copy), enableLuaRewardTimerUI (copy), durationNeededForReward (copy), var7 (copy)
			if var18.TimeLength > 0 then
				var5(var18.TimePosition / var18.TimeLength)
				
				if enableLuaRewardTimerUI and durationNeededForReward then
					if durationNeededForReward == 0 then
						var7(1)
						
						return
					end
					var7(math.min(var18.TimePosition / durationNeededForReward, 1))
				end
			end
		end)
		p1.onVideoFrameLoaded(var18)
		
		return function()
			-- upvalues: renderSteppedConnection (ref)
			renderSteppedConnection:Disconnect()
		end
	end, {})
	local var18 = var12 or var14
	local var19 = var16 == frozen.Playing and not var18
	
	return reactModule.createElement(view, {
		tag = "size-full",
		onActivated = function() end,
		stateLayer = { affordance = stateLayerAffordance.None },
		backgroundStyle = var1.Color.Extended.Black.Black_100
	}, {
		videoFrame = reactModule.createElement("VideoFrame", {
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Video = p1.creativeAssetUrl,
			Playing = var19,
			Transparency = if var12 then 0.4 else 0,
			ref = var11
		}, {
			reactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1.777777777778,
				AspectType = Enum.AspectType.FitWithinMaxSize
			}),
			testAdDisclaimer = if runService:IsStudio() then reactModule.createElement(require(components.TestAdDisclaimerComponent), { isEligible = p1.isEligible }) else nil,
			confirmExitModal = reactModule.createElement(exitConfirmationModalComponentModule, {
				Enabled = var12,
				onCancel = function()
					-- upvalues: var13 (ref)
					var13(false)
				end,
				onConfirm = p1.onCancel
			}),
			reportAdModal = reactModule.createElement(reportAdPopup, {
				showReportAdPopup = var14,
				onClose = function()
					-- upvalues: var15 (ref)
					var15(false)
				end,
				onOpen = function()
					-- upvalues: var15 (ref)
					var15(true)
				end,
				adInfo = p1.getReportAdInfo()
			}),
			videoOverlay = reactModule.createElement(videoOverlayComponentModule, {
				ref = var10,
				alpha = var4,
				totalDuration = var2,
				parentModalOpen = var18,
				rewardWaitTime = if enableLuaRewardTimerUI then durationNeededForReward else nil,
				rewardWaitAlpha = if enableLuaRewardTimerUI then var6 else nil,
				dismissModals = dismissParentModals,
				parentPaused = not var19,
				showWhyThisAd = p1.showWhyThisAd,
				setPaused = function(value)
					-- upvalues: var16 (ref), frozen (copy), var17 (ref)
					if var16 ~= frozen.Loading then
						var17(if value then frozen.Paused else frozen.Playing)
					end
				end,
				showReportAdModal = function()
					-- upvalues: var15 (ref)
					var15(true)
				end,
				showExitConfirmationModal = function()
					-- upvalues: flagsModule (copy), var6 (write), p1 (ref), var13 (ref), var15 (ref), enableLuaRewardTimerUI (ref), var10 (write)
					if flagsModule.GetEnableLuaRewardTimerUI() and var6:getValue() >= 1 then
						p1.onComplete()
						
						return
					end
					var13(false)
					var15(false)
					local var20 = if enableLuaRewardTimerUI then var10.current else var10:getValue()
					
					if var20 then
						var20.dismissModals()
					end
					var13(true)
				end
			})
		})
	})
end
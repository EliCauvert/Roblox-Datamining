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

return function(p0) --[[ line: 35 | named "AdPlayerComponent" ]]
	-- upvalues: flagsModule (ref), useTokens (ref), reactModule (ref), frozen (ref), runService (ref), components (ref), view (ref), stateLayerAffordance (ref), exitConfirmationModalComponentModule (ref), reportAdPopup (ref), videoOverlayComponentModule (ref)
	local enableLuaRewardTimerUI = flagsModule.GetEnableLuaRewardTimerUI()
	local var9 = useTokens()
	local var10, var11 = reactModule.useState(0)
	local var12, var13 = reactModule.useBinding(0)
	local var14 = nil
	local var15 = nil
	
	if enableLuaRewardTimerUI then
		local var16, var17 = reactModule.useBinding(0)
		var14 = var16
		var15 = var17
	end
	local var24, var25
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(false)
	local var22, var23 = reactModule.useState(frozen.Loading)
	local _ = nil
	local _ = nil
	
	if enableLuaRewardTimerUI then
		var24 = reactModule.createRef()
		var25 = reactModule.createRef()
	else
		var24 = reactModule.useRef(nil)
		var25 = reactModule.useRef(nil)
	end
	local durationNeededForReward = p0.durationNeededForReward
	
	local function dismissParentModals() --[[ line: 58 ]]
		-- upvalues: var19 (ref), var21 (ref)
		var19(false)
		var21(false)
	end
	
	local function _() --[[ line: 63 | named "dismissModals" ]]
		-- upvalues: var19 (ref), var21 (ref), enableLuaRewardTimerUI (ref), var24 (write)
		var19(false)
		var21(false)
		local var29 = if enableLuaRewardTimerUI then var24.current else var24:getValue()
		
		if var29 then
			var29.dismissModals()
		end
	end
	
	reactModule.useEffect(function() --[[ line: 78 ]]
		-- upvalues: enableLuaRewardTimerUI (ref), var25 (write), var23 (ref), frozen (copy), var11 (ref), p0 (ref), runService (copy), var13 (ref), durationNeededForReward (ref), var15 (write)
		local var30 = if enableLuaRewardTimerUI then var25.current else var25:getValue()
		
		if not var30.IsLoaded then
			var30.Loaded:Wait()
		end
		var23(frozen.Playing)
		var11(var30.TimeLength)
		var30.Ended:Connect(p0.onComplete)
		local renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 93 ]]
			-- upvalues: var30 (write), var13 (copy), enableLuaRewardTimerUI (copy), durationNeededForReward (copy), var15 (copy)
			if var30.TimeLength > 0 then
				var13(var30.TimePosition / var30.TimeLength)
				
				if enableLuaRewardTimerUI and durationNeededForReward then
					if durationNeededForReward == 0 then
						var15(1)
						
						return
					end
					var15(math.min(var30.TimePosition / durationNeededForReward, 1))
				end
			end
		end)
		p0.onVideoFrameLoaded(var30)
		
		return function() --[[ line: 111 ]]
			-- upvalues: renderSteppedConnection (ref)
			renderSteppedConnection:Disconnect()
		end
	end, {})
	local var18_1 = var18 or var20
	local var28 = var22 == frozen.Playing and not var18_1
	
	return reactModule.createElement(view, {
		tag = "size-full",
		onActivated = function() --[[ line: 128 ]] end,
		stateLayer = { affordance = stateLayerAffordance.None },
		backgroundStyle = var9.Color.Extended.Black.Black_100
	}, {
		videoFrame = reactModule.createElement("VideoFrame", {
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Video = p0.creativeAssetUrl,
			Playing = var28,
			Transparency = if var18 then 0.4 else 0,
			ref = var25
		}, {
			reactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1.777777777778,
				AspectType = Enum.AspectType.FitWithinMaxSize
			}),
			testAdDisclaimer = if runService:IsStudio() then reactModule.createElement(require(components.TestAdDisclaimerComponent), { isEligible = p0.isEligible }) else nil,
			confirmExitModal = reactModule.createElement(exitConfirmationModalComponentModule, {
				Enabled = var18,
				onCancel = function() --[[ line: 152 ]]
					-- upvalues: var19 (ref)
					var19(false)
				end,
				onConfirm = p0.onCancel
			}),
			reportAdModal = reactModule.createElement(reportAdPopup, {
				showReportAdPopup = var20,
				onClose = function() --[[ line: 159 ]]
					-- upvalues: var21 (ref)
					var21(false)
				end,
				onOpen = function() --[[ line: 162 ]]
					-- upvalues: var21 (ref)
					var21(true)
				end,
				adInfo = p0.getReportAdInfo()
			}),
			videoOverlay = reactModule.createElement(videoOverlayComponentModule, {
				ref = var24,
				alpha = var12,
				totalDuration = var10,
				parentModalOpen = var18_1,
				rewardWaitTime = if enableLuaRewardTimerUI then durationNeededForReward else nil,
				rewardWaitAlpha = if enableLuaRewardTimerUI then var14 else nil,
				dismissModals = dismissParentModals,
				parentPaused = not var28,
				showWhyThisAd = p0.showWhyThisAd,
				setPaused = function(value) --[[ line: 177 ]]
					-- upvalues: var22 (ref), frozen (copy), var23 (ref)
					if var22 ~= frozen.Loading then
						var23(if value then frozen.Paused else frozen.Playing)
					end
				end,
				showReportAdModal = function() --[[ line: 182 ]]
					-- upvalues: var21 (ref)
					var21(true)
				end,
				showExitConfirmationModal = function() --[[ line: 185 ]]
					-- upvalues: flagsModule (copy), var14 (write), p0 (ref), var19 (ref), var21 (ref), enableLuaRewardTimerUI (ref), var24 (write)
					if flagsModule.GetEnableLuaRewardTimerUI() and var14:getValue() >= 1 then
						p0.onComplete()
						
						return
					end
					var19(false)
					var21(false)
					local var32 = if enableLuaRewardTimerUI then var24.current else var24:getValue()
					
					if var32 then
						var32.dismissModals()
					end
					var19(true)
				end
			})
		})
	})
end
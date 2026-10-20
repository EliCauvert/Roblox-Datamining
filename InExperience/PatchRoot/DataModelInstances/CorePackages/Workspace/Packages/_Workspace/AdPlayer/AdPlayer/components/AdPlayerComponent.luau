local RunService = game:GetService("RunService")
local AdPlayer = script:FindFirstAncestor("AdPlayer")
local Parent = AdPlayer.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ReportAdPopup = require(Parent.AdGuiInteractivity).ReportAdPopup
local Components = AdPlayer.components
local VideoOverlayComponentModule = require(Components.VideoOverlayComponent)
local ExitConfirmationModalComponentModule = require(Components.ExitConfirmationModalComponent)
local FlagsModule = require(AdPlayer.Flags)
local Frozen = table.freeze({ Loading = 1, Paused = 2, Playing = 3 })

return function(p1)
	-- upvalues: FlagsModule (copy), UseTokensFunction (copy), ReactModule (copy), Frozen (copy), RunService (copy), Components (copy), View (copy), StateLayerAffordance (copy), ExitConfirmationModalComponentModule (copy), ReportAdPopup (copy), VideoOverlayComponentModule (copy)
	local EnableLuaRewardTimerUI = FlagsModule.GetEnableLuaRewardTimerUI()
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local v1 = nil
	local Callback = nil
	
	if EnableLuaRewardTimerUI then
		v1, Callback = ReactModule.useBinding(0)
	end
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(Frozen.Loading)
	local Ref = nil
	local Ref1 = nil
	
	if EnableLuaRewardTimerUI then
		Ref = ReactModule.createRef()
		Ref1 = ReactModule.createRef()
	else
		Ref = ReactModule.useRef(nil)
		Ref1 = ReactModule.useRef(nil)
	end
	local DurationNeededForReward = p1.durationNeededForReward
	
	local function dismissParentModals()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		UseStateResult2_1(false)
		UseStateResult2_2(false)
	end
	
	local function _()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy), EnableLuaRewardTimerUI (copy), Ref (ref)
		UseStateResult2_1(false)
		UseStateResult2_2(false)
		local Current = if EnableLuaRewardTimerUI then Ref.current else Ref:getValue()
		
		if Current then
			Current.dismissModals()
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: EnableLuaRewardTimerUI (copy), Ref1 (ref), UseStateResult2_3 (copy), Frozen (upval), UseStateResult2 (copy), p1 (copy), RunService (upval), UseBindingResult2 (copy), DurationNeededForReward (copy), Callback (ref)
		local Current = nil
		Current = if EnableLuaRewardTimerUI then Ref1.current else Ref1:getValue()
		
		if not Current.IsLoaded then
			Current.Loaded:Wait()
		end
		UseStateResult2_3(Frozen.Playing)
		UseStateResult2(Current.TimeLength)
		Current.Ended:Connect(p1.onComplete)
		local RenderSteppedConnection = RunService.RenderStepped:Connect(function()
			-- upvalues: Current (ref), UseBindingResult2 (upval), EnableLuaRewardTimerUI (upval), DurationNeededForReward (upval), Callback (upval)
			if Current.TimeLength > 0 then
				UseBindingResult2(Current.TimePosition / Current.TimeLength)
				
				if EnableLuaRewardTimerUI and DurationNeededForReward then
					if DurationNeededForReward == 0 then
						Callback(1)
						
						return
					end
					Callback((math.min(Current.TimePosition / DurationNeededForReward, 1)))
				end
			end
		end)
		p1.onVideoFrameLoaded(Current)
		
		return function()
			-- upvalues: RenderSteppedConnection (copy)
			RenderSteppedConnection:Disconnect()
		end
	end, {})
	local UseStateResult1_1 = UseStateResult1 or UseStateResult3
	local NoUseStateResult1_1: boolean = UseStateResult4 == Frozen.Playing and not UseStateResult1_1
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		onActivated = function() end,
		stateLayer = { affordance = StateLayerAffordance.None },
		backgroundStyle = UseTokensResult.Color.Extended.Black.Black_100
	}, {
		videoFrame = ReactModule.createElement("VideoFrame", {
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Video = p1.creativeAssetUrl,
			Playing = NoUseStateResult1_1,
			Transparency = if UseStateResult1 then 0.4 else 0,
			ref = Ref1
		}, {
			ReactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1.7777777777777777,
				AspectType = Enum.AspectType.FitWithinMaxSize
			}),
			testAdDisclaimer = if RunService:IsStudio() then ReactModule.createElement(require(Components.TestAdDisclaimerComponent), { isEligible = p1.isEligible }) else nil,
			confirmExitModal = ReactModule.createElement(ExitConfirmationModalComponentModule, {
				Enabled = UseStateResult1,
				onCancel = function()
					-- upvalues: UseStateResult2_1 (copy)
					UseStateResult2_1(false)
				end,
				onConfirm = p1.onCancel
			}),
			reportAdModal = ReactModule.createElement(ReportAdPopup, {
				showReportAdPopup = UseStateResult3,
				onClose = function()
					-- upvalues: UseStateResult2_2 (copy)
					UseStateResult2_2(false)
				end,
				onOpen = function()
					-- upvalues: UseStateResult2_2 (copy)
					UseStateResult2_2(true)
				end,
				adInfo = p1.getReportAdInfo()
			}),
			videoOverlay = ReactModule.createElement(VideoOverlayComponentModule, {
				ref = Ref,
				alpha = UseBindingResult,
				totalDuration = UseStateResult,
				parentModalOpen = UseStateResult1_1,
				rewardWaitTime = if EnableLuaRewardTimerUI then DurationNeededForReward else nil,
				rewardWaitAlpha = if EnableLuaRewardTimerUI then v1 else nil,
				dismissModals = dismissParentModals,
				parentPaused = not NoUseStateResult1_1,
				showWhyThisAd = p1.showWhyThisAd,
				setPaused = function(p2)
					-- upvalues: UseStateResult4 (copy), Frozen (upval), UseStateResult2_3 (copy)
					if UseStateResult4 ~= Frozen.Loading then
						UseStateResult2_3(if p2 then Frozen.Paused else Frozen.Playing)
					end
				end,
				showReportAdModal = function()
					-- upvalues: UseStateResult2_2 (copy)
					UseStateResult2_2(true)
				end,
				showExitConfirmationModal = function()
					-- upvalues: FlagsModule (upval), v1 (ref), p1 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), EnableLuaRewardTimerUI (copy), Ref (ref)
					if FlagsModule.GetEnableLuaRewardTimerUI() and v1:getValue() >= 1 then
						p1.onComplete()
						
						return
					end
					UseStateResult2_1(false)
					UseStateResult2_2(false)
					local Current = if EnableLuaRewardTimerUI then Ref.current else Ref:getValue()
					
					if Current then
						Current.dismissModals()
					end
					UseStateResult2_1(true)
				end
			})
		})
	})
end
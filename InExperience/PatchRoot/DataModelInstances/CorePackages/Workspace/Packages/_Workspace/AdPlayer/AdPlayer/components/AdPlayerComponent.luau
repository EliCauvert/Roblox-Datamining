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
local Frozen = table.freeze({ Loading = 1, Paused = 2, Playing = 3 })

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Frozen (copy), RunService (copy), Components (copy), View (copy), StateLayerAffordance (copy), ExitConfirmationModalComponentModule (copy), ReportAdPopup (copy), VideoOverlayComponentModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(Frozen.Loading)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	
	local function dismissParentModals()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		UseStateResult2_1(false)
		UseStateResult2_2(false)
	end
	
	local function _()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseRefResult (copy)
		UseStateResult2_1(false)
		UseStateResult2_2(false)
		local Value = UseRefResult:getValue()
		
		if Value then
			Value.dismissModals()
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseStateResult2_3 (copy), Frozen (upval), UseStateResult2 (copy), p1 (copy), RunService (upval), UseBindingResult2 (copy)
		local Value = UseRefResult1:getValue()
		
		if not Value.IsLoaded then
			Value.Loaded:Wait()
		end
		UseStateResult2_3(Frozen.Playing)
		UseStateResult2(Value.TimeLength)
		Value.Ended:Connect(p1.onComplete)
		local RenderSteppedConnection = RunService.RenderStepped:Connect(function()
			-- upvalues: Value (copy), UseBindingResult2 (upval)
			if Value.TimeLength > 0 then
				UseBindingResult2(Value.TimePosition / Value.TimeLength)
			end
		end)
		p1.onVideoFrameLoaded(Value)
		
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
			ref = UseRefResult1
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
				ref = UseRefResult,
				alpha = UseBindingResult,
				totalDuration = UseStateResult,
				parentModalOpen = UseStateResult1_1,
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
					-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseRefResult (copy)
					UseStateResult2_1(false)
					UseStateResult2_2(false)
					local Value = UseRefResult:getValue()
					
					if Value then
						Value.dismissModals()
					end
					UseStateResult2_1(true)
				end
			})
		})
	})
end
local parent = script.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local fadeControllerModule = require(parent.FadeController)
local adLabelModule = require(parent.AdLabel)
local circularButtonModule = require(parent.CircularButton)
local livePreviewWatermarkModule = require(parent.LivePreviewWatermark)
local flagsModule = require(script.Parent.Flags)
local sharedFlagsModule = require(parent_1.SharedFlags)
local UIBloxModule = require(parent_1.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local images = UIBloxModule.App.ImageSet.Images
local speakerMute = images["icons/controls/speakerMute"]
local speaker = images["icons/controls/speaker"]
local previewExpand = images["icons/actions/previewExpand"]
local previewShrink = images["icons/actions/previewShrink"]
local var8 = images["icons/controls/media-play-large"]
local var9 = images["icons/controls/media-pause-large"]
local close = images["icons/navigation/close"]
local circle42Stroke3 = images["component_assets/circle_42_stroke_3"]
local fFlagEnableReportAdDropdown = flagsModule.GetFFlagEnableReportAdDropdown()
local enableHideReportAdModalDuringScreenshot = flagsModule.GetEnableHideReportAdModalDuringScreenshot()
local fFlagInExperienceUseAppStyleProvider = sharedFlagsModule.FFlagInExperienceUseAppStyleProvider
local var12 = if fFlagEnableReportAdDropdown then require(parent.ReportAdPopup) else nil
local var13 = if fFlagEnableReportAdDropdown then require(parent.AdDropdownMenu) else nil
local adsInteractivityTelemetryModule = require(parent.AdsInteractivityTelemetry)
local adsInteractivityControls = roactModule.PureComponent:extend("AdsInteractivityControls")

local function _(p0) --[[ line: 39 | named "opacityToTransparency" ]]
	return 1 - p0
end

local adGuiInteractivityPixelsPerStud = flagsModule.GetAdGuiInteractivityPixelsPerStud()

local _ = function(p1) --[[ line: 46 | named "getAdornee" ]]
	return if p1 == nil then nil elseif p1.Adornee == nil then if p1.Parent == nil or not p1.Parent:IsA("BasePart") then nil else p1.Parent else p1.Adornee
end

function adsInteractivityControls.init(p2) --[[ line: 61 ]]
	-- upvalues: fadeControllerModule (ref), roactModule (ref)
	if game:GetEngineFeature("DeprecateCpv15") then
		p2.state = {
			isViewable = false,
			videoPlaying = false,
			isFullscreen = false,
			eudsaPromptActive = false,
			isDropDownOpen = false,
			isReportAdPopupOpen = false,
			hideLivePreviewWatermark = false,
			adUIType = Enum.AdUIType.None,
			adGuiRectStuds = Vector2.new(0, 0)
		}
	else
		p2.state = {
			isViewable = false,
			videoPlaying = false,
			isFullscreen = false,
			isClickToPlay = false,
			eudsaPromptActive = false,
			isDropDownOpen = false,
			isReportAdPopupOpen = false,
			hideLivePreviewWatermark = false,
			adUIType = Enum.AdUIType.None,
			adGuiRectStuds = Vector2.new(0, 0)
		}
	end
	local function onAdorneeChanged() --[[ line: 89 ]]
		-- upvalues: p2 (ref)
		local t = {}
		local adGui = p2.props.adGui
		t.adornee = if adGui == nil then nil elseif adGui.Adornee ~= nil then if adGui.Parent == nil or not adGui.Parent:IsA("BasePart") then nil else adGui.Parent else adGui.Adornee
		p2:setState(t)
	end
	
	p2.signalConnections = {
		p2.props.adGui:GetPropertyChangedSignal("Adornee"):Connect(onAdorneeChanged),
		p2.props.adGui:GetPropertyChangedSignal("Parent"):Connect(onAdorneeChanged)
	}
	p2.props.adGui.adGuiStateChanged:Connect(function(p3) --[[ line: 100 ]]
		-- upvalues: p2 (ref)
		p2:setState(p3)
	end)
	p2.fadeController = fadeControllerModule.new()
	local var18, var19 = roactModule.createBinding(1)
	p2.controlsOpacity = var18
	p2.updateControlsOpacity = var19
	p2.fadeController:subscribe(function(p4) --[[ line: 107 ]]
		-- upvalues: p2 (ref)
		p2.updateControlsOpacity(p4)
	end)
	p2.props.adGui:forwardStateToLuaUI()
end

function adsInteractivityControls.willUnmount(p5) --[[ line: 114 ]]
	for i, v in ipairs(p5.signalConnections) do
		v:Disconnect()
	end
end

function adsInteractivityControls.render(p6) --[[ line: 120 ]]
	-- upvalues: var9 (ref), var8 (ref), speaker (ref), speakerMute (ref), previewShrink (ref), previewExpand (ref), roactModule (ref), fFlagEnableReportAdDropdown (ref), adGuiInteractivityPixelsPerStud (ref), adsInteractivityTelemetryModule (ref), var12 (ref), enableHideReportAdModalDuringScreenshot (ref), var13 (ref), adLabelModule (ref), circularButtonModule (ref), close (ref), imageSetLabel (ref), circle42Stroke3 (ref), livePreviewWatermarkModule (ref)
	if not p6.props.adGui then
		return nil
	end
	local var21 = p6.state.adUIType == Enum.AdUIType.Video
	local var22 = p6.state.adUIType == Enum.AdUIType.None
	local var23 = nil
	
	if game:GetEngineFeature("DeprecateCpv15") then
		if var21 and p6.state.isFullscreen then
			var23 = if p6.state.videoPlaying then var9 else var8
		end
	elseif var21 then
		if p6.state.isFullscreen and not p6.state.videoPlaying or p6.state.isClickToPlay and not p6.state.isFullscreen then
			var23 = var8
		elseif p6.state.isFullscreen and p6.state.videoPlaying then
			var23 = var9
		end
	end
	local isFullscreen = var21 and p6.state.isFullscreen
	local _ = nil
	local var25 = if game:GetEngineFeature("DeprecateCpv15") then var21 and (not p6.state.isFullscreen and p6.state.videoPlaying) else var21 and (not p6.state.isFullscreen and (not p6.state.isClickToPlay and p6.state.videoPlaying))
	local var26 = if p6.state.volumeEnabled then speaker else speakerMute
	local var27 = if p6.state.isFullscreen then previewShrink else previewExpand
	local vector2 = Vector2.new(0.10038949275, 0.17847020934)
	
	if not p6.state.isFullscreen then
		vector2 *= 1.5
	end
	local var29 = if not p6.state.isViewable then false else p6.controlsOpacity:map(function(p7) --[[ line: 166 ]]
		-- upvalues: var23 (write), var8 (copy)
		return var23 == var8 or (var23 ~= nil and (p7 and p7 > 0))
	end)
	local var30 = p6.controlsOpacity:map(function(p8) --[[ line: 177 ]]
		-- upvalues: var23 (write), var8 (copy)
		return if var23 == var8 then 0.2 else 1 - p8 * 0.8
	end)
	local createElement = roactModule.createElement
	local var31 = "SurfaceGui"
	local t = {
		ZOffset = 1,
		LightInfluence = 0,
		Brightness = 2,
		ZIndexBehavior = if fFlagEnableReportAdDropdown then Enum.ZIndexBehavior.Sibling else Enum.ZIndexBehavior.Global,
		SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
		PixelsPerStud = adGuiInteractivityPixelsPerStud
	}
	local adGui = p6.props.adGui
	t.Adornee = if adGui == nil then nil elseif adGui.Adornee ~= nil then if adGui.Parent == nil or not adGui.Parent:IsA("BasePart") then nil else adGui.Parent else adGui.Adornee
	t.Face = p6.props.adGui.Face
	t.AlwaysOnTop = p6.state.isFullscreen
	local t_1 = {
		InteractiveArea = adGui("TextButton", {
			Size = UDim2.fromOffset(p6.state.adGuiRectStuds.X * adGuiInteractivityPixelsPerStud, p6.state.adGuiRectStuds.Y * adGuiInteractivityPixelsPerStud),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = p6.controlsOpacity:map(function(p9) --[[ line: 204 ]]
				-- upvalues: var23 (write), var8 (copy)
				return if var23 == var8 then 0.7 else 1 - p9 * 0.3
			end),
			Text = "",
			[roactModule.Event.MouseMoved] = function(_, _) --[[ line: 213 ]]
				-- upvalues: var21 (ref), p6 (ref)
				if var21 and p6.state.isFullscreen then
					p6.fadeController:updateLastInputTime()
				end
			end,
			[roactModule.Event.Activated] = function(_, p10) --[[ line: 218 ]]
				-- upvalues: fFlagEnableReportAdDropdown (copy), p6 (ref), adsInteractivityTelemetryModule (copy), var21 (ref)
				if fFlagEnableReportAdDropdown and p6.state.isDropDownOpen then
					p6:setState({ isDropDownOpen = false })
					p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
					p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
					adsInteractivityTelemetryModule.logAdMenuEvent("close")
					
					return
				elseif var21 then
					if p6.state.isFullscreen then
						if p6.state.videoPlaying then
							if p10.UserInputType ~= Enum.UserInputType.Touch then
								p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked)
								
								return
							elseif p6.fadeController:inProgress() and not p6.fadeController:isFading() then
								p6.fadeController:skipToFade()
								
								return
							end
							p6.fadeController:updateLastInputTime()
							
							return
						else
							p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						end
					elseif p6.state.isViewable then
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.FullscreenButtonClicked)
						
						return
					end
				end
			end
		}, {
			AbuseReportingModal = fFlagEnableReportAdDropdown and (var12 and (p6.state.isReportAdPopupOpen and (roactModule.createElement(var12, {
				showReportAdPopup = p6.state.isReportAdPopupOpen,
				onClose = function() --[[ line: 256 ]]
					-- upvalues: p6 (ref)
					p6:setState({ isReportAdPopupOpen = false })
				end,
				onOpen = if enableHideReportAdModalDuringScreenshot then function() --[[ line: 262 ]]
					-- upvalues: p6 (ref), adsInteractivityTelemetryModule (copy)
					p6:setState({ isReportAdPopupOpen = true })
					adsInteractivityTelemetryModule.logReportAdEvent("open")
				end else nil,
				adInfo = p6.props.adGui:GetSingleReportAdInfo()
			}) or nil))),
			AdDropdownMenu = if fFlagEnableReportAdDropdown and var13 then roactModule.createElement(var13, {
				showDropDownMenu = p6.state.isDropDownOpen,
				onWhyThisAdActivated = function() --[[ line: 276 ]]
					-- upvalues: p6 (ref), adsInteractivityTelemetryModule (copy)
					p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.WhyThisAdClicked)
					adsInteractivityTelemetryModule.logWhyThisAdEvent()
				end,
				onReportAdActivated = function() --[[ line: 281 ]]
					-- upvalues: p6 (ref)
					p6:setState({ isReportAdPopupOpen = true })
				end,
				transparency = 0.2
			}) else nil,
			AdLabel = roactModule.createElement(adLabelModule, {
				onActivated = if fFlagEnableReportAdDropdown then function() --[[ line: 291 ]]
					-- upvalues: p6 (ref), adsInteractivityTelemetryModule (copy)
					p6:setState({ isDropDownOpen = not p6.state.isDropDownOpen })
					
					if p6.state.isDropDownOpen then
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
					else
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseEventTriggered)
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked)
					end
					adsInteractivityTelemetryModule.logAdMenuEvent(if p6.state.isDropDownOpen then "open" else "close")
				end else function() --[[ line: 305 ]]
					-- upvalues: p6 (ref)
					p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.AdLabelClicked)
				end,
				isMenuOpen = p6.state.isDropDownOpen,
				Visible = not var22
			}),
			CloseButton = roactModule.createElement(circularButtonModule, {
				HorizontalScale = 0.06884057971,
				Position = UDim2.fromScale(0.995, 0.005),
				AnchorPoint = Vector2.new(1, 0),
				ImageSize = UDim2.fromScale(0.8, 0.8),
				Image = close,
				Visible = isFullscreen,
				Transparency = var30,
				AutoButtonColor = if fFlagEnableReportAdDropdown and p6.state.isDropDownOpen then false else true,
				onActivated = function() --[[ line: 320 ]]
					-- upvalues: fFlagEnableReportAdDropdown (copy), p6 (ref), adsInteractivityTelemetryModule (copy)
					if fFlagEnableReportAdDropdown and p6.state.isDropDownOpen then
						p6:setState({ isDropDownOpen = false })
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						adsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					end
					p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.CloseButtonClicked)
				end
			}),
			PlayPauseButton = roactModule.createElement("ImageButton", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(vector2.X, vector2.Y),
				Visible = var29,
				AutoButtonColor = if fFlagEnableReportAdDropdown and p6.state.isDropDownOpen then false else true,
				[roactModule.Event.Activated] = function() --[[ line: 341 ]]
					-- upvalues: fFlagEnableReportAdDropdown (copy), p6 (ref), adsInteractivityTelemetryModule (copy), var23 (write), var8 (copy), var9 (copy)
					if fFlagEnableReportAdDropdown and p6.state.isDropDownOpen then
						p6:setState({ isDropDownOpen = false })
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						adsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					elseif var23 == var8 then
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						
						return
					elseif var23 == var9 then
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked)
					end
				end
			}, {
				circle = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = circle42Stroke3,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = var30
				}),
				icon = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = var23,
					Size = UDim2.fromScale(0.6, 0.6),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = var30
				})
			}),
			VolumeButton = roactModule.createElement(circularButtonModule, {
				HorizontalScale = 0.12,
				Visible = var25,
				Position = UDim2.fromScale(0.075, 0.75),
				Image = var26,
				ImageSize = UDim2.fromScale(0.8, 0.8),
				AutoButtonColor = if fFlagEnableReportAdDropdown and p6.state.isDropDownOpen then false else true,
				onActivated = function() --[[ line: 383 ]]
					-- upvalues: fFlagEnableReportAdDropdown (copy), p6 (ref), adsInteractivityTelemetryModule (copy)
					if fFlagEnableReportAdDropdown and p6.state.isDropDownOpen then
						p6:setState({ isDropDownOpen = false })
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						adsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					end
					p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.VolumeButtonClicked)
				end,
				Transparency = 0.2
			}),
			FullscreenButton = roactModule.createElement(circularButtonModule, {
				HorizontalScale = 0.12,
				Visible = var25,
				Position = UDim2.fromScale(0.87625, 0.75),
				AnchorPoint = Vector2.new(1, 0),
				Image = var27,
				ImageSize = UDim2.fromScale(0.7, 0.7),
				AutoButtonColor = if fFlagEnableReportAdDropdown and p6.state.isDropDownOpen then false else true,
				onActivated = function() --[[ line: 405 ]]
					-- upvalues: fFlagEnableReportAdDropdown (copy), p6 (ref), adsInteractivityTelemetryModule (copy)
					if fFlagEnableReportAdDropdown and p6.state.isDropDownOpen then
						p6:setState({ isDropDownOpen = false })
						p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						adsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					end
					p6.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.FullscreenButtonClicked)
				end,
				Transparency = 0.2
			}),
			LivePreviewWatermark = roactModule.createElement(livePreviewWatermarkModule, { IsVisible = not p6.state.hideLivePreviewWatermark } or nil) or nil
		})
	}
	adGui = roactModule.createElement
	
	return createElement(var31, t, t_1)
end

return if fFlagInExperienceUseAppStyleProvider then function(p11) --[[ line: 427 | named "AdsInteractivityFunctionalWrapper" ]]
	-- upvalues: UIBloxModule (ref), roactModule (ref), appStyleProvider (ref), adsInteractivityControls (ref)
	return roactModule.createElement(appStyleProvider, {
		style = {
			themeName = UIBloxModule.App.Style.Constants.ThemeName.Dark
		}
	}, {
		AdsInteractivityControls = roactModule.createElement(adsInteractivityControls, p11)
	})
end else adsInteractivityControls
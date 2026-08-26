local parent = script.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local colorMode = require(parent_1.Foundation).Enums.ColorMode
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
local var1 = images["icons/controls/media-play-large"]
local var2 = images["icons/controls/media-pause-large"]
local close = images["icons/navigation/close"]
local circle42Stroke3 = images["component_assets/circle_42_stroke_3"]
local fFlagEnableReportAdDropdown = flagsModule.GetFFlagEnableReportAdDropdown()
local enableHideReportAdModalDuringScreenshot = flagsModule.GetEnableHideReportAdModalDuringScreenshot()
local fFlagFixReportAdInfoDuringRotation = flagsModule.FFlagFixReportAdInfoDuringRotation
local fFlagInExperienceUseAppStyleProvider = sharedFlagsModule.FFlagInExperienceUseAppStyleProvider
local var3 = if fFlagFixReportAdInfoDuringRotation then require(parent_1.ArgCheck) else nil
local var4 = if fFlagEnableReportAdDropdown then require(parent.ReportAdPopup) else nil
local var5 = if fFlagEnableReportAdDropdown then require(parent.AdDropdownMenu) else nil
local adsInteractivityTelemetryModule = require(parent.AdsInteractivityTelemetry)
local adsInteractivityControls = roactModule.PureComponent:extend("AdsInteractivityControls")

local function _(p1)
	return 1 - p1
end

local adGuiInteractivityPixelsPerStud = flagsModule.GetAdGuiInteractivityPixelsPerStud()

local _ = function(p1)
	return if p1 == nil then nil elseif p1.Adornee == nil then if p1.Parent == nil or not p1.Parent:IsA("BasePart") then nil else p1.Parent else p1.Adornee
end

function adsInteractivityControls.init(p1)
	-- upvalues: fadeControllerModule (ref), roactModule (ref)
	if game:GetEngineFeature("DeprecateCpv15") then
		p1.state = {
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
		p1.state = {
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
	local function onAdorneeChanged()
		-- upvalues: p1 (ref)
		local t = {}
		local adGui = p1.props.adGui
		t.adornee = if adGui == nil then nil elseif adGui.Adornee ~= nil then if adGui.Parent == nil or not adGui.Parent:IsA("BasePart") then nil else adGui.Parent else adGui.Adornee
		p1:setState(t)
	end
	
	p1.signalConnections = {
		p1.props.adGui:GetPropertyChangedSignal("Adornee"):Connect(onAdorneeChanged),
		p1.props.adGui:GetPropertyChangedSignal("Parent"):Connect(onAdorneeChanged)
	}
	p1.props.adGui.adGuiStateChanged:Connect(function(p2)
		-- upvalues: p1 (ref)
		p1:setState(p2)
	end)
	p1.fadeController = fadeControllerModule.new()
	local var6, var7 = roactModule.createBinding(1)
	p1.controlsOpacity = var6
	p1.updateControlsOpacity = var7
	p1.fadeController:subscribe(function(p2)
		-- upvalues: p1 (ref)
		p1.updateControlsOpacity(p2)
	end)
	p1.props.adGui:forwardStateToLuaUI()
end

function adsInteractivityControls.willUnmount(p1)
	for i, v in ipairs(p1.signalConnections) do
		v:Disconnect()
	end
end

function adsInteractivityControls.render(p2)
	-- upvalues: var2 (ref), var1 (ref), speaker (ref), speakerMute (ref), previewShrink (ref), previewExpand (ref), roactModule (ref), fFlagEnableReportAdDropdown (ref), adGuiInteractivityPixelsPerStud (ref), adsInteractivityTelemetryModule (ref), var4 (ref), enableHideReportAdModalDuringScreenshot (ref), fFlagFixReportAdInfoDuringRotation (ref), var3 (write), var5 (ref), adLabelModule (ref), circularButtonModule (ref), close (ref), imageSetLabel (ref), circle42Stroke3 (ref), livePreviewWatermarkModule (ref)
	if not p2.props.adGui then
		return nil
	end
	local var6 = p2.state.adUIType == Enum.AdUIType.Video
	local var7 = p2.state.adUIType == Enum.AdUIType.None
	local var8 = nil
	
	if game:GetEngineFeature("DeprecateCpv15") then
		if var6 and p2.state.isFullscreen then
			var8 = if p2.state.videoPlaying then var2 else var1
		end
	elseif var6 then
		if p2.state.isFullscreen and not p2.state.videoPlaying or p2.state.isClickToPlay and not p2.state.isFullscreen then
			var8 = var1
		elseif p2.state.isFullscreen and p2.state.videoPlaying then
			var8 = var2
		end
	end
	local isFullscreen = var6 and p2.state.isFullscreen
	local _ = nil
	local var9 = if game:GetEngineFeature("DeprecateCpv15") then var6 and (not p2.state.isFullscreen and p2.state.videoPlaying) else var6 and (not p2.state.isFullscreen and (not p2.state.isClickToPlay and p2.state.videoPlaying))
	local var10 = if p2.state.volumeEnabled then speaker else speakerMute
	local var11 = if p2.state.isFullscreen then previewShrink else previewExpand
	local vector2 = Vector2.new(0.10038949275, 0.17847020934)
	
	if not p2.state.isFullscreen then
		vector2 *= 1.5
	end
	local var12 = if not p2.state.isViewable then false else p2.controlsOpacity:map(function(p3)
		-- upvalues: var8 (write), var1 (copy)
		return var8 == var1 or (var8 ~= nil and (p3 and p3 > 0))
	end)
	local var13 = p2.controlsOpacity:map(function(p3)
		-- upvalues: var8 (write), var1 (copy)
		return if var8 == var1 then 0.2 else 1 - p3 * 0.8
	end)
	local createElement = roactModule.createElement
	local var14 = "SurfaceGui"
	local t = {
		ZOffset = 1,
		LightInfluence = 0,
		Brightness = 2,
		ZIndexBehavior = if fFlagEnableReportAdDropdown then Enum.ZIndexBehavior.Sibling else Enum.ZIndexBehavior.Global,
		SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
		PixelsPerStud = adGuiInteractivityPixelsPerStud
	}
	local adGui = p2.props.adGui
	t.Adornee = if adGui == nil then nil elseif adGui.Adornee ~= nil then if adGui.Parent == nil or not adGui.Parent:IsA("BasePart") then nil else adGui.Parent else adGui.Adornee
	t.Face = p2.props.adGui.Face
	t.AlwaysOnTop = p2.state.isFullscreen
	local t_1 = {
		InteractiveArea = adGui("TextButton", {
			Size = UDim2.fromOffset(p2.state.adGuiRectStuds.X * adGuiInteractivityPixelsPerStud, p2.state.adGuiRectStuds.Y * adGuiInteractivityPixelsPerStud),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = p2.controlsOpacity:map(function(p3)
				-- upvalues: var8 (write), var1 (copy)
				return if var8 == var1 then 0.7 else 1 - p3 * 0.3
			end),
			Text = "",
			[roactModule.Event.MouseMoved] = function(_, _)
				-- upvalues: var6 (ref), p2 (ref)
				if var6 and p2.state.isFullscreen then
					p2.fadeController:updateLastInputTime()
				end
			end,
			[roactModule.Event.Activated] = function(_, p3)
				-- upvalues: fFlagEnableReportAdDropdown (copy), p2 (ref), adsInteractivityTelemetryModule (copy), var6 (ref)
				if fFlagEnableReportAdDropdown and p2.state.isDropDownOpen then
					p2:setState({ isDropDownOpen = false })
					p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
					p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
					adsInteractivityTelemetryModule.logAdMenuEvent("close")
					
					return
				elseif var6 then
					if p2.state.isFullscreen then
						if p2.state.videoPlaying then
							if p3.UserInputType ~= Enum.UserInputType.Touch then
								p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked)
								
								return
							elseif p2.fadeController:inProgress() and not p2.fadeController:isFading() then
								p2.fadeController:skipToFade()
								
								return
							end
							p2.fadeController:updateLastInputTime()
							
							return
						else
							p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						end
					elseif p2.state.isViewable then
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.FullscreenButtonClicked)
						
						return
					end
				end
			end
		}, {
			AbuseReportingModal = fFlagEnableReportAdDropdown and (var4 and (p2.state.isReportAdPopupOpen and (roactModule.createElement(var4, {
				showReportAdPopup = p2.state.isReportAdPopupOpen,
				onClose = function()
					-- upvalues: p2 (ref)
					p2:setState({ isReportAdPopupOpen = false })
				end,
				onOpen = if enableHideReportAdModalDuringScreenshot then function()
					-- upvalues: p2 (ref), adsInteractivityTelemetryModule (copy)
					p2:setState({ isReportAdPopupOpen = true })
					adsInteractivityTelemetryModule.logReportAdEvent("open")
				end else nil,
				adInfo = if fFlagFixReportAdInfoDuringRotation then var3.isNotNil(p2.state.reportAdInfo, "reportAdInfo") or p2.props.adGui:GetSingleReportAdInfo() else p2.props.adGui:GetSingleReportAdInfo()
			}) or nil))),
			AdDropdownMenu = if fFlagEnableReportAdDropdown and var5 then roactModule.createElement(var5, {
				showDropDownMenu = p2.state.isDropDownOpen,
				onWhyThisAdActivated = function()
					-- upvalues: p2 (ref), adsInteractivityTelemetryModule (copy)
					p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.WhyThisAdClicked)
					adsInteractivityTelemetryModule.logWhyThisAdEvent()
				end,
				onReportAdActivated = function()
					-- upvalues: p2 (ref)
					p2:setState({ isReportAdPopupOpen = true })
				end,
				transparency = 0.2
			}) else nil,
			AdLabel = roactModule.createElement(adLabelModule, {
				onActivated = if fFlagEnableReportAdDropdown then function()
					-- upvalues: fFlagFixReportAdInfoDuringRotation (copy), p2 (ref), adsInteractivityTelemetryModule (copy)
					if fFlagFixReportAdInfoDuringRotation then
						local t = { isDropDownOpen = not p2.state.isDropDownOpen }
						
						if not p2.state.isDropDownOpen then
							t.reportAdInfo = p2.props.adGui:GetSingleReportAdInfo()
						end
						p2:setState(t)
					else
						p2:setState({ isDropDownOpen = not p2.state.isDropDownOpen })
					end
					if p2.state.isDropDownOpen then
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
					else
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseEventTriggered)
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked)
					end
					adsInteractivityTelemetryModule.logAdMenuEvent(if p2.state.isDropDownOpen then "open" else "close")
				end else function()
					-- upvalues: p2 (ref)
					p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.AdLabelClicked)
				end,
				isMenuOpen = p2.state.isDropDownOpen,
				Visible = not var7
			}),
			CloseButton = roactModule.createElement(circularButtonModule, {
				HorizontalScale = 0.06884057971,
				Position = UDim2.fromScale(0.995, 0.005),
				AnchorPoint = Vector2.new(1, 0),
				ImageSize = UDim2.fromScale(0.8, 0.8),
				Image = close,
				Visible = isFullscreen,
				Transparency = var13,
				AutoButtonColor = if fFlagEnableReportAdDropdown and p2.state.isDropDownOpen then false else true,
				onActivated = function()
					-- upvalues: fFlagEnableReportAdDropdown (copy), p2 (ref), adsInteractivityTelemetryModule (copy)
					if fFlagEnableReportAdDropdown and p2.state.isDropDownOpen then
						p2:setState({ isDropDownOpen = false })
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						adsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					end
					p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.CloseButtonClicked)
				end
			}),
			PlayPauseButton = roactModule.createElement("ImageButton", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(vector2.X, vector2.Y),
				Visible = var12,
				AutoButtonColor = if fFlagEnableReportAdDropdown and p2.state.isDropDownOpen then false else true,
				[roactModule.Event.Activated] = function()
					-- upvalues: fFlagEnableReportAdDropdown (copy), p2 (ref), adsInteractivityTelemetryModule (copy), var8 (write), var1 (copy), var2 (copy)
					if fFlagEnableReportAdDropdown and p2.state.isDropDownOpen then
						p2:setState({ isDropDownOpen = false })
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						adsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					elseif var8 == var1 then
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						
						return
					elseif var8 == var2 then
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked)
					end
				end
			}, {
				circle = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = circle42Stroke3,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = var13
				}),
				icon = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = var8,
					Size = UDim2.fromScale(0.6, 0.6),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = var13
				})
			}),
			VolumeButton = roactModule.createElement(circularButtonModule, {
				HorizontalScale = 0.12,
				Visible = var9,
				Position = UDim2.fromScale(0.075, 0.75),
				Image = var10,
				ImageSize = UDim2.fromScale(0.8, 0.8),
				AutoButtonColor = if fFlagEnableReportAdDropdown and p2.state.isDropDownOpen then false else true,
				onActivated = function()
					-- upvalues: fFlagEnableReportAdDropdown (copy), p2 (ref), adsInteractivityTelemetryModule (copy)
					if fFlagEnableReportAdDropdown and p2.state.isDropDownOpen then
						p2:setState({ isDropDownOpen = false })
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						adsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					end
					p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.VolumeButtonClicked)
				end,
				Transparency = 0.2
			}),
			FullscreenButton = roactModule.createElement(circularButtonModule, {
				HorizontalScale = 0.12,
				Visible = var9,
				Position = UDim2.fromScale(0.87625, 0.75),
				AnchorPoint = Vector2.new(1, 0),
				Image = var11,
				ImageSize = UDim2.fromScale(0.7, 0.7),
				AutoButtonColor = if fFlagEnableReportAdDropdown and p2.state.isDropDownOpen then false else true,
				onActivated = function()
					-- upvalues: fFlagEnableReportAdDropdown (copy), p2 (ref), adsInteractivityTelemetryModule (copy)
					if fFlagEnableReportAdDropdown and p2.state.isDropDownOpen then
						p2:setState({ isDropDownOpen = false })
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						adsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					end
					p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.FullscreenButtonClicked)
				end,
				Transparency = 0.2
			}),
			LivePreviewWatermark = roactModule.createElement(livePreviewWatermarkModule, { IsVisible = not p2.state.hideLivePreviewWatermark } or nil) or nil
		})
	}
	adGui = roactModule.createElement
	
	return createElement(var14, t, t_1)
end

return if fFlagInExperienceUseAppStyleProvider then function(p2)
	-- upvalues: roactModule (ref), appStyleProvider (ref), colorMode (ref), adsInteractivityControls (ref)
	return roactModule.createElement(appStyleProvider, { style = { themeName = colorMode.Dark } }, {
		AdsInteractivityControls = roactModule.createElement(adsInteractivityControls, p2)
	})
end else adsInteractivityControls
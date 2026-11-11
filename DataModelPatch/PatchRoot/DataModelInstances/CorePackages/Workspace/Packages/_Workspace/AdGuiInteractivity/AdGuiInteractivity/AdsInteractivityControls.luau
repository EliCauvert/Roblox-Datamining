local Parent = script.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local FadeControllerModule = require(Parent.FadeController)
local AdLabelModule = require(Parent.AdLabel)
local CircularButtonModule = require(Parent.CircularButton)
local LivePreviewWatermarkModule = require(Parent.LivePreviewWatermark)
local FlagsModule = require(script.Parent.Flags)
local UIBloxModule = require(Parent1.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local Images = UIBloxModule.App.ImageSet.Images
local IconsControlsSpeakerMute = Images["icons/controls/speakerMute"]
local IconsControlsSpeaker = Images["icons/controls/speaker"]
local IconsActionsPreviewExpand = Images["icons/actions/previewExpand"]
local IconsActionsPreviewShrink = Images["icons/actions/previewShrink"]
local IconsControlsMediaPlayLarge = Images["icons/controls/media-play-large"]
local IconsControlsMediaPauseLarge = Images["icons/controls/media-pause-large"]
local IconsNavigationClose = Images["icons/navigation/close"]
local ComponentAssetsCircle42Stroke3 = Images["component_assets/circle_42_stroke_3"]
local FFlagEnableReportAdDropdown = FlagsModule.GetFFlagEnableReportAdDropdown()
local EnableHideReportAdModalDuringScreenshot = FlagsModule.GetEnableHideReportAdModalDuringScreenshot()
local FFlagInExperienceUseAppStyleProvider = require(Parent1.SharedFlags).FFlagInExperienceUseAppStyleProvider
local ReportAdPopupModule = if FFlagEnableReportAdDropdown then require(Parent.ReportAdPopup) else nil
local AdDropdownMenuModule = if FFlagEnableReportAdDropdown then require(Parent.AdDropdownMenu) else nil
local AdsInteractivityTelemetryModule = require(Parent.AdsInteractivityTelemetry)
local AdsInteractivityControls = RoactModule.PureComponent:extend("AdsInteractivityControls")

local function _(p1: number): number
	return 1 - p1
end

local AdGuiInteractivityPixelsPerStud = FlagsModule.GetAdGuiInteractivityPixelsPerStud()

local _ = function(p1)
	return if p1 == nil then nil elseif p1.Adornee == nil then if p1.Parent == nil or not p1.Parent:IsA("BasePart") then nil else p1.Parent else p1.Adornee
end

function AdsInteractivityControls.init(p1)
	-- upvalues: FadeControllerModule (copy), RoactModule (copy)
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
		-- upvalues: p1 (copy)
		local AdGui = p1.props.adGui
		p1:setState({
			adornee = if AdGui == nil then nil elseif AdGui.Adornee == nil then if AdGui.Parent == nil or not AdGui.Parent:IsA("BasePart") then nil else AdGui.Parent else AdGui.Adornee
		})
	end
	
	p1.signalConnections = {
		p1.props.adGui:GetPropertyChangedSignal("Adornee"):Connect(onAdorneeChanged),
		p1.props.adGui:GetPropertyChangedSignal("Parent"):Connect(onAdorneeChanged)
	}
	p1.props.adGui.adGuiStateChanged:Connect(function(AdUIState)
		-- upvalues: p1 (copy)
		p1:setState(AdUIState)
	end)
	p1.fadeController = FadeControllerModule.new()
	p1.controlsOpacity, p1.updateControlsOpacity = RoactModule.createBinding(1)
	p1.fadeController:subscribe(function(p2)
		-- upvalues: p1 (copy)
		p1.updateControlsOpacity(p2)
	end)
	p1.props.adGui:forwardStateToLuaUI()
end

function AdsInteractivityControls.willUnmount(p1)
	for _, signalConnection in ipairs(p1.signalConnections) do
		signalConnection:Disconnect()
	end
end

function AdsInteractivityControls.render(p2)
	-- upvalues: IconsControlsMediaPauseLarge (copy), IconsControlsMediaPlayLarge (copy), IconsControlsSpeaker (copy), IconsControlsSpeakerMute (copy), IconsActionsPreviewShrink (copy), IconsActionsPreviewExpand (copy), RoactModule (copy), FFlagEnableReportAdDropdown (copy), AdGuiInteractivityPixelsPerStud (copy), AdsInteractivityTelemetryModule (copy), ReportAdPopupModule (copy), EnableHideReportAdModalDuringScreenshot (copy), AdDropdownMenuModule (copy), AdLabelModule (copy), CircularButtonModule (copy), IconsNavigationClose (copy), ImageSetLabel (copy), ComponentAssetsCircle42Stroke3 (copy), LivePreviewWatermarkModule (copy)
	if not p2.props.adGui then
		return nil
	end
	local IsAdUITypeMatch = p2.state.adUIType == Enum.AdUIType.Video
	local IsAdUITypeMatch1 = p2.state.adUIType == Enum.AdUIType.None
	local IconsControlsMediaPlayLarge1 = nil
	
	if game:GetEngineFeature("DeprecateCpv15") then
		if IsAdUITypeMatch and p2.state.isFullscreen then
			IconsControlsMediaPlayLarge1 = if p2.state.videoPlaying then IconsControlsMediaPauseLarge else IconsControlsMediaPlayLarge
		end
	elseif IsAdUITypeMatch then
		if p2.state.isFullscreen and not p2.state.videoPlaying or p2.state.isClickToPlay and not p2.state.isFullscreen then
			IconsControlsMediaPlayLarge1 = IconsControlsMediaPlayLarge
		elseif p2.state.isFullscreen and p2.state.videoPlaying then
			IconsControlsMediaPlayLarge1 = IconsControlsMediaPauseLarge
		end
	end
	local IsFullscreen = IsAdUITypeMatch and p2.state.isFullscreen
	local VideoPlaying = if game:GetEngineFeature("DeprecateCpv15") then IsAdUITypeMatch and (not p2.state.isFullscreen and p2.state.videoPlaying) else IsAdUITypeMatch and (not p2.state.isFullscreen and (not p2.state.isClickToPlay and p2.state.videoPlaying))
	local IconsControlsSpeaker1 = p2.state.volumeEnabled and IconsControlsSpeaker or IconsControlsSpeakerMute
	local IconsActionsPreviewShrink1 = p2.state.isFullscreen and IconsActionsPreviewShrink or IconsActionsPreviewExpand
	local _Vector2 = Vector2.new(0.10038949275, 0.17847020934)
	
	if not p2.state.isFullscreen then
		_Vector2 *= 1.5
	end
	local MapResult = p2.controlsOpacity:map(function(p3: number): number
		-- upvalues: IconsControlsMediaPlayLarge1 (ref), IconsControlsMediaPlayLarge (upval)
		return if IconsControlsMediaPlayLarge1 == IconsControlsMediaPlayLarge then 0.19999999999999996 else 1 - p3 * 0.8
	end)
	local AdGui = p2.props.adGui
	
	return RoactModule.createElement("SurfaceGui", {
		ZOffset = 1,
		LightInfluence = 0,
		Brightness = 2,
		ZIndexBehavior = if FFlagEnableReportAdDropdown then Enum.ZIndexBehavior.Sibling else Enum.ZIndexBehavior.Global,
		SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
		PixelsPerStud = AdGuiInteractivityPixelsPerStud,
		Adornee = if AdGui == nil then nil elseif AdGui.Adornee == nil then if AdGui.Parent == nil or not AdGui.Parent:IsA("BasePart") then nil else AdGui.Parent else AdGui.Adornee,
		Face = p2.props.adGui.Face,
		AlwaysOnTop = p2.state.isFullscreen
	}, {
		InteractiveArea = RoactModule.createElement("TextButton", {
			Size = UDim2.fromOffset(p2.state.adGuiRectStuds.X * AdGuiInteractivityPixelsPerStud, p2.state.adGuiRectStuds.Y * AdGuiInteractivityPixelsPerStud),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = p2.controlsOpacity:map(function(p3: number): number
				-- upvalues: IconsControlsMediaPlayLarge1 (ref), IconsControlsMediaPlayLarge (upval)
				return if IconsControlsMediaPlayLarge1 == IconsControlsMediaPlayLarge then 0.7 else 1 - p3 * 0.3
			end),
			Text = "",
			[RoactModule.Event.MouseMoved] = function(_, _)
				-- upvalues: IsAdUITypeMatch (copy), p2 (copy)
				if IsAdUITypeMatch and p2.state.isFullscreen then
					p2.fadeController:updateLastInputTime()
				end
			end,
			[RoactModule.Event.Activated] = function(_, Input)
				-- upvalues: FFlagEnableReportAdDropdown (upval), p2 (copy), AdsInteractivityTelemetryModule (upval), IsAdUITypeMatch (copy)
				if FFlagEnableReportAdDropdown and p2.state.isDropDownOpen then
					p2:setState({ isDropDownOpen = false })
					p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
					p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
					AdsInteractivityTelemetryModule.logAdMenuEvent("close")
					
					return
				end
				if IsAdUITypeMatch then
					if p2.state.isFullscreen then
						if not p2.state.videoPlaying then
							p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						elseif Input.UserInputType ~= Enum.UserInputType.Touch then
							p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked)
							
							return
						else
							if p2.fadeController:inProgress() and not p2.fadeController:isFading() then
								p2.fadeController:skipToFade()
								
								return
							else
								p2.fadeController:updateLastInputTime()
								
								return
							end
						end
					elseif p2.state.isViewable then
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.FullscreenButtonClicked)
						
						return
					end
				end
			end
		}, {
			AbuseReportingModal = FFlagEnableReportAdDropdown and ReportAdPopupModule and p2.state.isReportAdPopupOpen and RoactModule.createElement(ReportAdPopupModule, {
				showReportAdPopup = p2.state.isReportAdPopupOpen,
				onClose = function()
					-- upvalues: p2 (copy)
					p2:setState({ isReportAdPopupOpen = false })
				end,
				onOpen = if EnableHideReportAdModalDuringScreenshot then function()
					-- upvalues: p2 (copy), AdsInteractivityTelemetryModule (upval)
					p2:setState({ isReportAdPopupOpen = true })
					AdsInteractivityTelemetryModule.logReportAdEvent("open")
				end else nil,
				adInfo = p2.props.adGui:GetSingleReportAdInfo()
			}) or nil,
			AdDropdownMenu = if FFlagEnableReportAdDropdown and AdDropdownMenuModule then RoactModule.createElement(AdDropdownMenuModule, {
				showDropDownMenu = p2.state.isDropDownOpen,
				onWhyThisAdActivated = function()
					-- upvalues: p2 (copy), AdsInteractivityTelemetryModule (upval)
					p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.WhyThisAdClicked)
					AdsInteractivityTelemetryModule.logWhyThisAdEvent()
				end,
				onReportAdActivated = function()
					-- upvalues: p2 (copy)
					p2:setState({ isReportAdPopupOpen = true })
				end,
				transparency = 0.19999999999999996
			}) else nil,
			AdLabel = RoactModule.createElement(AdLabelModule, {
				onActivated = if FFlagEnableReportAdDropdown then function()
					-- upvalues: p2 (copy), AdsInteractivityTelemetryModule (upval)
					p2:setState({ isDropDownOpen = not p2.state.isDropDownOpen })
					
					if p2.state.isDropDownOpen then
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
					else
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseEventTriggered)
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked)
					end
					AdsInteractivityTelemetryModule.logAdMenuEvent(if p2.state.isDropDownOpen then "open" else "close")
				end else function()
					-- upvalues: p2 (copy)
					p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.AdLabelClicked)
				end,
				isMenuOpen = p2.state.isDropDownOpen,
				Visible = not IsAdUITypeMatch1
			}),
			CloseButton = RoactModule.createElement(CircularButtonModule, {
				HorizontalScale = 0.06884057971,
				Position = UDim2.fromScale(0.995, 0.005),
				AnchorPoint = Vector2.new(1, 0),
				ImageSize = UDim2.fromScale(0.8, 0.8),
				Image = IconsNavigationClose,
				Visible = IsFullscreen,
				Transparency = MapResult,
				AutoButtonColor = not FFlagEnableReportAdDropdown or not p2.state.isDropDownOpen,
				onActivated = function()
					-- upvalues: FFlagEnableReportAdDropdown (upval), p2 (copy), AdsInteractivityTelemetryModule (upval)
					if FFlagEnableReportAdDropdown and p2.state.isDropDownOpen then
						p2:setState({ isDropDownOpen = false })
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						AdsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					else
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.CloseButtonClicked)
					end
				end
			}),
			PlayPauseButton = RoactModule.createElement("ImageButton", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(_Vector2.X, _Vector2.Y),
				Visible = if p2.state.isViewable then p2.controlsOpacity:map(function(p3: number): boolean
					-- upvalues: IconsControlsMediaPlayLarge1 (ref), IconsControlsMediaPlayLarge (upval)
					return IconsControlsMediaPlayLarge1 == IconsControlsMediaPlayLarge or IconsControlsMediaPlayLarge1 ~= nil and (p3 and p3 > 0)
				end) else false,
				AutoButtonColor = not FFlagEnableReportAdDropdown or not p2.state.isDropDownOpen,
				[RoactModule.Event.Activated] = function()
					-- upvalues: FFlagEnableReportAdDropdown (upval), p2 (copy), AdsInteractivityTelemetryModule (upval), IconsControlsMediaPlayLarge1 (ref), IconsControlsMediaPlayLarge (upval), IconsControlsMediaPauseLarge (upval)
					if FFlagEnableReportAdDropdown and p2.state.isDropDownOpen then
						p2:setState({ isDropDownOpen = false })
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						AdsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					end
					if IconsControlsMediaPlayLarge1 == IconsControlsMediaPlayLarge then
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked)
						
						return
					end
					if IconsControlsMediaPlayLarge1 == IconsControlsMediaPauseLarge then
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked)
					end
				end
			}, {
				circle = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = ComponentAssetsCircle42Stroke3,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = MapResult
				}),
				icon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = IconsControlsMediaPlayLarge1,
					Size = UDim2.fromScale(0.6, 0.6),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = MapResult
				})
			}),
			VolumeButton = RoactModule.createElement(CircularButtonModule, {
				HorizontalScale = 0.12,
				Visible = VideoPlaying,
				Position = UDim2.fromScale(0.075, 0.75),
				Image = IconsControlsSpeaker1,
				ImageSize = UDim2.fromScale(0.8, 0.8),
				AutoButtonColor = not FFlagEnableReportAdDropdown or not p2.state.isDropDownOpen,
				onActivated = function()
					-- upvalues: FFlagEnableReportAdDropdown (upval), p2 (copy), AdsInteractivityTelemetryModule (upval)
					if FFlagEnableReportAdDropdown and p2.state.isDropDownOpen then
						p2:setState({ isDropDownOpen = false })
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						AdsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					else
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.VolumeButtonClicked)
					end
				end,
				Transparency = 0.19999999999999996
			}),
			FullscreenButton = RoactModule.createElement(CircularButtonModule, {
				HorizontalScale = 0.12,
				Visible = VideoPlaying,
				Position = UDim2.fromScale(0.87625, 0.75),
				AnchorPoint = Vector2.new(1, 0),
				Image = IconsActionsPreviewShrink1,
				ImageSize = UDim2.fromScale(0.7, 0.7),
				AutoButtonColor = not FFlagEnableReportAdDropdown or not p2.state.isDropDownOpen,
				onActivated = function()
					-- upvalues: FFlagEnableReportAdDropdown (upval), p2 (copy), AdsInteractivityTelemetryModule (upval)
					if FFlagEnableReportAdDropdown and p2.state.isDropDownOpen then
						p2:setState({ isDropDownOpen = false })
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered)
						AdsInteractivityTelemetryModule.logAdMenuEvent("close")
						
						return
					else
						p2.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.FullscreenButtonClicked)
					end
				end,
				Transparency = 0.19999999999999996
			}),
			LivePreviewWatermark = RoactModule.createElement(LivePreviewWatermarkModule, { IsVisible = not p2.state.hideLivePreviewWatermark } or nil) or nil
		})
	})
end

local function AdsInteractivityFunctionalWrapper(p2)
	-- upvalues: UIBloxModule (copy), RoactModule (copy), AppStyleProvider (copy), AdsInteractivityControls (copy)
	return RoactModule.createElement(AppStyleProvider, {
		style = {
			themeName = UIBloxModule.App.Style.Constants.ThemeName.Dark
		}
	}, {
		AdsInteractivityControls = RoactModule.createElement(AdsInteractivityControls, p2)
	})
end

return if FFlagInExperienceUseAppStyleProvider then AdsInteractivityFunctionalWrapper else AdsInteractivityControls
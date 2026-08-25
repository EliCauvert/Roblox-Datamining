local userInputService = game:GetService("UserInputService")
local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactRoduxModule = require(parent.RoactRodux)
local roactAppExperimentModule = require(parent.RoactAppExperiment)
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local areaTestModule = require(authCommon.Utils.AreaTest)
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local openTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local getFFlagLuaAppFixSelectionCursor = require(parent.SharedFlags).GetFFlagLuaAppFixSelectionCursor
local getFFlagEnableTextFieldContentType = require(parent.SharedFlags).GetFFlagEnableTextFieldContentType
local getFFlagLuaAppEnableOpenTypeSupport = require(parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local guiObjectInputSinkEngineFeature = game:GetEngineFeature("GuiObjectInputSink")
local enableKeyboardVisibilityCheckOnPasswordFocus = game:DefineFastFlag("EnableKeyboardVisibilityCheckOnPasswordFocus", false)
local enableAndroidPasswordSuggestionEngineFeature = game:GetEngineFeature("EnableAndroidPasswordSuggestion")
local fFlagAndroidPasswordSuggestionExperimentEnrollmentBypass = require(parent.SharedFlags).FFlagAndroidPasswordSuggestionExperimentEnrollmentBypass
local fStringLuaMultiPageSignupIxpLayer = require(parent.SharedFlags).FStringLuaMultiPageSignupIxpLayer
local passwordBox = roactModule.PureComponent:extend("PasswordBox")

function passwordBox.init(p0)
	-- upvalues: roactModule (ref), areaTestModule (ref), enableKeyboardVisibilityCheckOnPasswordFocus (ref), userInputService (ref)
	p0.state = { hidePassword = true, containerSize = Vector2.new(0, 0) }
	
	function p0.getHidePassword()
		-- upvalues: p0 (ref)
		return if p0.props.hidePassword == nil then p0.state.hidePassword else p0.props.hidePassword
	end
	
	p0.isMounted = false
	p0.passwordBoxRef = roactModule.createRef()
	local var11 = roactModule.createRef()
	
	function p0.getPasswordTextBoxRef()
		-- upvalues: p0 (ref), var11 (ref)
		return p0.props.TextBoxRef or var11
	end
	
	function p0.isTouchPositionInPasswordBox(p1)
		-- upvalues: p0 (ref), areaTestModule (copy)
		if p0.passwordBoxRef.current then
			local absolutePosition = p0.passwordBoxRef.current.AbsolutePosition
			
			return areaTestModule.IsPointInRect(Rect.new(absolutePosition, absolutePosition + p0.passwordBoxRef.current.AbsoluteSize), p1)
		end
		return false
	end
	
	p0.tapBeganInTextbox = false
	
	function p0.tapEventBegan(p2, _)
		-- upvalues: p0 (ref), enableKeyboardVisibilityCheckOnPasswordFocus (copy), userInputService (copy)
		if p0.props.CentralOverlayBlocksInput and p0.props.centralOverlay and p0.props.centralOverlay.OverlayType ~= nil then return end
		if enableKeyboardVisibilityCheckOnPasswordFocus and not userInputService.OnScreenKeyboardVisible then return end
		p0.tapBeganInTextbox = p0.isTouchPositionInPasswordBox(p2)
		local current = p0.getPasswordTextBoxRef().current
		local focusedTextBox = userInputService:GetFocusedTextBox()
		
		if current and focusedTextBox ~= current and (p0.tapBeganInTextbox and p0.props.CaptureFocusOnTapStart) then
			if focusedTextBox then
				focusedTextBox:ReleaseFocus()
			end
			current:CaptureFocus()
		end
	end
	
	function p0.tapEventEnded(p3, _)
		-- upvalues: p0 (ref), userInputService (copy)
		if p0.tapBeganInTextbox then
			p0.tapBeganInTextbox = false
			
			return
		end
		local focusedTextBox = userInputService:GetFocusedTextBox()
		local current = p0.getPasswordTextBoxRef().current
		
		if not focusedTextBox or focusedTextBox ~= current then return end
		if not p0.isTouchPositionInPasswordBox(p3) then
			current:ReleaseFocus()
		end
	end
	
	function p0.onAbsoluteSizeChanged(p4)
		-- upvalues: p0 (ref)
		local absoluteSize = p4.AbsoluteSize
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 and p0.state.containerSize ~= absoluteSize then
			spawn(function()
				-- upvalues: p0 (copy), absoluteSize (ref)
				if p0.isMounted then
					p0:setState({ containerSize = absoluteSize })
				end
			end)
		end
	end
	
	function p0.onTogglerActivated(_)
		-- upvalues: p0 (ref)
		local onToggleCallback = p0.props.onToggleCallback
		local hidePassword = p0.getHidePassword()
		
		if onToggleCallback then
			onToggleCallback(hidePassword)
		end
		if p0.isMounted then
			p0:setState({ hidePassword = not hidePassword })
		end
	end
	
	function p0.shouldTakeInput(p5)
		-- upvalues: p0 (ref)
		return if p0.props.Disabled then false else not p0.props.ManualFocusRelease and (if p5.UserInputType ~= Enum.UserInputType.MouseButton1 then p5.UserInputType == Enum.UserInputType.Touch else true)
	end
end

passwordBox.defaultProps = {
	PaddingX = 10,
	PaddingY = 7,
	ClearTextOnFocus = false,
	IsKeyboardOverlayUsed = true,
	TextXAlignment = Enum.TextXAlignment.Left
}

function passwordBox.didMount(p6)
	-- upvalues: userInputService (ref)
	p6.isMounted = true
	
	if p6.props.IsKeyboardOverlayUsed then
		p6.inputBeganConnection = userInputService.InputBegan:connect(function(p7, p8)
			-- upvalues: p6 (ref)
			if p6.shouldTakeInput(p7) then
				p6.tapEventBegan(p7.Position, p8)
			end
		end)
		p6.inputEndedConnection = userInputService.InputEnded:connect(function(p9, p10)
			-- upvalues: p6 (ref)
			if p6.shouldTakeInput(p9) then
				p6.tapEventEnded(p9.Position, p10)
			end
		end)
	end
end

function passwordBox.willUnmount(p11)
	p11.isMounted = false
	
	if p11.props.IsKeyboardOverlayUsed then
		if p11.inputBeganConnection then
			p11.inputBeganConnection:disconnect()
		end
		if p11.inputEndedConnection then
			p11.inputEndedConnection:disconnect()
		end
	end
end

function passwordBox.render(p12)
	-- upvalues: getFFlagLuaAppFixSelectionCursor (ref), withSelectionCursorProvider (ref)
	return if getFFlagLuaAppFixSelectionCursor() then withSelectionCursorProvider(function(p13)
		-- upvalues: p12 (ref)
		return p12:renderWithSelectionCursor(p13)
	end) else p12:renderWithSelectionCursor(nil)
end

function passwordBox.renderWithSelectionCursor(_, _)
	-- upvalues: enableAndroidPasswordSuggestionEngineFeature (ref), getFFlagEnableTextFieldContentType (ref), withStyle (ref), getFFlagLuaAppFixSelectionCursor (ref), cursorKind (ref), roactModule (ref), imageSetLabel (ref), getImageData (ref), guiObjectInputSinkEngineFeature (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref)
-- FATAL: Failed to generate AST for `renderWithSelectionCursor` function:
runtime : [KeyError] :11990: 148
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

passwordBox = roactRoduxModule.connect(function(p14, _)
	return { centralOverlay = p14.CentralOverlay }
end)(passwordBox)

if enableAndroidPasswordSuggestionEngineFeature then
	passwordBox = roactAppExperimentModule.connectBrowserTrackerLayer({ fStringLuaMultiPageSignupIxpLayer }, function(p15, _)
		-- upvalues: fStringLuaMultiPageSignupIxpLayer (ref), fFlagAndroidPasswordSuggestionExperimentEnrollmentBypass (ref)
		return {
			enablePasswordSuggestion = (p15[fStringLuaMultiPageSignupIxpLayer] or {}).enablePasswordSuggestion or (fFlagAndroidPasswordSuggestionExperimentEnrollmentBypass or false)
		}
	end)(passwordBox)
end
return passwordBox
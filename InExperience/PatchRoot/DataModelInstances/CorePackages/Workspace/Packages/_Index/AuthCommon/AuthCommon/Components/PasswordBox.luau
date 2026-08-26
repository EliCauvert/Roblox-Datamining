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

function passwordBox.init(p1)
	-- upvalues: roactModule (ref), areaTestModule (ref), enableKeyboardVisibilityCheckOnPasswordFocus (ref), userInputService (ref)
	p1.state = { hidePassword = true, containerSize = Vector2.new(0, 0) }
	
	function p0.getHidePassword()
		-- upvalues: p1 (ref)
		return if p1.props.hidePassword == nil then p1.state.hidePassword else p1.props.hidePassword
	end
	
	p1.isMounted = false
	p1.passwordBoxRef = roactModule.createRef()
	local var1 = roactModule.createRef()
	
	function p0.getPasswordTextBoxRef()
		-- upvalues: p1 (ref), var1 (ref)
		return p1.props.TextBoxRef or var1
	end
	
	function p0.isTouchPositionInPasswordBox(p2)
		-- upvalues: p1 (ref), areaTestModule (copy)
		if p1.passwordBoxRef.current then
			local absolutePosition = p1.passwordBoxRef.current.AbsolutePosition
			
			return areaTestModule.IsPointInRect(Rect.new(absolutePosition, absolutePosition + p1.passwordBoxRef.current.AbsoluteSize), p2)
		end
		return false
	end
	
	p1.tapBeganInTextbox = false
	
	function p0.tapEventBegan(p2, _)
		-- upvalues: p1 (ref), enableKeyboardVisibilityCheckOnPasswordFocus (copy), userInputService (copy)
		if p1.props.CentralOverlayBlocksInput and p1.props.centralOverlay and p1.props.centralOverlay.OverlayType ~= nil then return end
		if enableKeyboardVisibilityCheckOnPasswordFocus and not userInputService.OnScreenKeyboardVisible then return end
		p1.tapBeganInTextbox = p1.isTouchPositionInPasswordBox(p2)
		local current = p1.getPasswordTextBoxRef().current
		local focusedTextBox = userInputService:GetFocusedTextBox()
		
		if current and focusedTextBox ~= current and (p1.tapBeganInTextbox and p1.props.CaptureFocusOnTapStart) then
			if focusedTextBox then
				focusedTextBox:ReleaseFocus()
			end
			current:CaptureFocus()
		end
	end
	
	function p0.tapEventEnded(p2, _)
		-- upvalues: p1 (ref), userInputService (copy)
		if p1.tapBeganInTextbox then
			p1.tapBeganInTextbox = false
			
			return
		end
		local focusedTextBox = userInputService:GetFocusedTextBox()
		local current = p1.getPasswordTextBoxRef().current
		
		if not focusedTextBox or focusedTextBox ~= current then return end
		if not p1.isTouchPositionInPasswordBox(p2) then
			current:ReleaseFocus()
		end
	end
	
	function p0.onAbsoluteSizeChanged(p2)
		-- upvalues: p1 (ref)
		local absoluteSize = p2.AbsoluteSize
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 and p1.state.containerSize ~= absoluteSize then
			spawn(function()
				-- upvalues: p1 (copy), absoluteSize (ref)
				if p1.isMounted then
					p1:setState({ containerSize = absoluteSize })
				end
			end)
		end
	end
	
	function p0.onTogglerActivated(_)
		-- upvalues: p1 (ref)
		local onToggleCallback = p1.props.onToggleCallback
		local hidePassword = p1.getHidePassword()
		
		if onToggleCallback then
			onToggleCallback(hidePassword)
		end
		if p1.isMounted then
			p1:setState({ hidePassword = not hidePassword })
		end
	end
	
	function p0.shouldTakeInput(p2)
		-- upvalues: p1 (ref)
		return if p1.props.Disabled then false else not p1.props.ManualFocusRelease and (if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true)
	end
end

passwordBox.defaultProps = {
	PaddingX = 10,
	PaddingY = 7,
	ClearTextOnFocus = false,
	IsKeyboardOverlayUsed = true,
	TextXAlignment = Enum.TextXAlignment.Left
}

function passwordBox.didMount(p1)
	-- upvalues: userInputService (ref)
	p1.isMounted = true
	
	if p1.props.IsKeyboardOverlayUsed then
		p1.inputBeganConnection = userInputService.InputBegan:connect(function(p2, p3)
			-- upvalues: p1 (ref)
			if p1.shouldTakeInput(p2) then
				p1.tapEventBegan(p2.Position, p3)
			end
		end)
		p1.inputEndedConnection = userInputService.InputEnded:connect(function(p2, p3)
			-- upvalues: p1 (ref)
			if p1.shouldTakeInput(p2) then
				p1.tapEventEnded(p2.Position, p3)
			end
		end)
	end
end

function passwordBox.willUnmount(p1)
	p1.isMounted = false
	
	if p1.props.IsKeyboardOverlayUsed then
		if p1.inputBeganConnection then
			p1.inputBeganConnection:disconnect()
		end
		if p1.inputEndedConnection then
			p1.inputEndedConnection:disconnect()
		end
	end
end

function passwordBox.render(p1)
	-- upvalues: getFFlagLuaAppFixSelectionCursor (ref), withSelectionCursorProvider (ref)
	return if getFFlagLuaAppFixSelectionCursor() then withSelectionCursorProvider(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end) else p1:renderWithSelectionCursor(nil)
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

passwordBox = roactRoduxModule.connect(function(p1, _)
	return { centralOverlay = p1.CentralOverlay }
end)(passwordBox)

if enableAndroidPasswordSuggestionEngineFeature then
	passwordBox = roactAppExperimentModule.connectBrowserTrackerLayer({ fStringLuaMultiPageSignupIxpLayer }, function(p1, _)
		-- upvalues: fStringLuaMultiPageSignupIxpLayer (ref), fFlagAndroidPasswordSuggestionExperimentEnrollmentBypass (ref)
		return {
			enablePasswordSuggestion = (p1[fStringLuaMultiPageSignupIxpLayer] or {}).enablePasswordSuggestion or (fFlagAndroidPasswordSuggestionExperimentEnrollmentBypass or false)
		}
	end)(passwordBox)
end
return passwordBox
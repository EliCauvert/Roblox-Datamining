local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local T = InGameMenuDependenciesModule.t
local Roact = InGameMenuDependenciesModule.Roact
local Cryo = InGameMenuDependenciesModule.Cryo
local GetFFlagIGMGamepadSelectionHistoryModule = require(script.Parent.Parent.Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local FocusHandlerContextModule = require(script.Parent.FocusHandlerUtils.FocusHandlerContext)
local Id = 1
local FocusHandler = Roact.PureComponent:extend("FocusHandler")
FocusHandler.validateProps = T.strictInterface({
	isFocused = T.boolean,
	didFocus = T.optional(T.callback),
	didBlur = T.optional(T.callback),
	shouldForgetPreviousSelection = GetFFlagIGMGamepadSelectionHistoryModule() and T.optional(T.boolean) or nil,
	currentHandlerId = GetFFlagIGMGamepadSelectionHistoryModule() and T.optional(T.number) or nil,
	candidateHandlerId = GetFFlagIGMGamepadSelectionHistoryModule() and T.optional(T.number) or nil,
	previousSelections = GetFFlagIGMGamepadSelectionHistoryModule() and T.table or nil,
	requestFocusForHandlerId = GetFFlagIGMGamepadSelectionHistoryModule() and T.callback or nil,
	forgetLastSelectionForHandlerId = GetFFlagIGMGamepadSelectionHistoryModule() and T.callback or nil,
	blurCurrentFocusHandler = GetFFlagIGMGamepadSelectionHistoryModule() and T.callback or nil,
	[Roact.Children] = T.optional(T.table)
})

if GetFFlagIGMGamepadSelectionHistoryModule() then
	function FocusHandler.init(p1) --[[ Line: 50 ]]
		-- upvalues: Id (ref)
		p1.id = Id
		Id += 1
	end
end
function FocusHandler.render(p1) --[[ Line: 56 ]]
	-- upvalues: Roact (copy)
	return Roact.createFragment(p1.props[Roact.Children])
end

if GetFFlagIGMGamepadSelectionHistoryModule() then
	function FocusHandler.didMount(p1) --[[ Line: 61 ]]
		if p1.props.isFocused then
			p1.props.requestFocusForHandlerId(p1.id)
		end
	end
else
	function FocusHandler.didMount(p1) --[[ Line: 67 ]]
		if p1.props.isFocused then
			p1.props.didFocus()
		end
	end
end
if GetFFlagIGMGamepadSelectionHistoryModule() then
	function FocusHandler.didUpdate(p1, p2) --[[ Line: 75 ]]
		local PreviousSelection = p1.props.previousSelections[p1.id]
		
		if p1.props.shouldForgetPreviousSelection and not p2.shouldForgetPreviousSelection or PreviousSelection ~= nil and not PreviousSelection:IsDescendantOf(game) then
			p1.props.forgetLastSelectionForHandlerId(p1.id)
			PreviousSelection = nil
		end
		local HasCandidateHandlerId: boolean = p1.props.candidateHandlerId ~= p1.id and p1.props.candidateHandlerId ~= nil
		local HasCandidateHandlerId1: boolean = p2.candidateHandlerId ~= p1.id and p2.candidateHandlerId ~= nil
		local IsNotCurrentHandlerIdMatch: boolean = p1.props.currentHandlerId == p1.id and p2.currentHandlerId ~= p1.id
		local IsFocused = p1.props.currentHandlerId == nil and (p2.currentHandlerId ~= nil and p2.currentHandlerId ~= p1.id) and (not HasCandidateHandlerId and p1.props.isFocused)
		local NoIsFocused: boolean = p2.isFocused and not p1.props.isFocused or HasCandidateHandlerId and not HasCandidateHandlerId1
		local IsNotCurrentHandlerIdMatch1: boolean = p2.currentHandlerId == p1.id and p1.props.currentHandlerId ~= p1.id
		
		if not p2.isFocused and p1.props.isFocused or IsFocused then
			p1.props.requestFocusForHandlerId(p1.id)
		elseif IsNotCurrentHandlerIdMatch and p1.props.didFocus then
			p1.props.didFocus(PreviousSelection)
		end
		if NoIsFocused and p1.props.currentHandlerId == p1.id then
			p1.props.blurCurrentFocusHandler(p1.id, p1.props.shouldForgetPreviousSelection)
		end
		if IsNotCurrentHandlerIdMatch1 and p1.props.didBlur then
			p1.props.didBlur()
		end
	end
else
	function FocusHandler.didUpdate(p1, p2) --[[ Line: 135 ]]
		if p1.props.isFocused and not p2.isFocused and p1.props.didFocus then
			p1.props.didFocus()
			
			return
		end
		if not p1.props.isFocused and p2.isFocused and p1.props.didBlur then
			p1.props.didBlur()
		end
	end
end
if GetFFlagIGMGamepadSelectionHistoryModule() then
	function FocusHandler.willUnmount(p1) --[[ Line: 145 ]]
		if p1.props.isFocused then
			p1.props.blurCurrentFocusHandler(p1.id, true)
			
			if p1.props.didBlur then
				p1.props.didBlur()
				
				return
			end
		else
			p1.props.forgetLastSelectionForHandlerId(p1.id)
		end
	end
else
	function FocusHandler.willUnmount(p1) --[[ Line: 156 ]]
		if p1.props.isFocused and p1.props.didBlur then
			p1.props.didBlur()
		end
	end
end
return if GetFFlagIGMGamepadSelectionHistoryModule() then function(p1) --[[ Line: 164 | Named "FocusHandlerWithContext" ]]
	-- upvalues: Roact (copy), FocusHandlerContextModule (copy), FocusHandler (copy), Cryo (copy)
	return Roact.createElement(FocusHandlerContextModule.Consumer, {
		render = function(p2) --[[ Line: 166 ]]
			-- upvalues: Roact (upval), FocusHandler (upval), Cryo (upval), p1 (copy)
			return Roact.createElement(FocusHandler, Cryo.Dictionary.join(p1, {
				currentHandlerId = p2.currentHandlerId,
				previousSelections = p2.previousSelections,
				requestFocusForHandlerId = p2.requestFocusForHandlerId,
				forgetLastSelectionForHandlerId = p2.forgetLastSelectionForHandlerId,
				blurCurrentFocusHandler = p2.blurCurrentFocusHandler,
				candidateHandlerId = p2.candidateHandlerId
			}))
		end
	})
end else FocusHandler
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local getFFlagIGMGamepadSelectionHistoryModule = require(script.Parent.Parent.Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local focusHandlerContextModule = require(script.Parent.FocusHandlerUtils.FocusHandlerContext)
local var1 = 1
local focusHandler = roact.PureComponent:extend("FocusHandler")
focusHandler.validateProps = t.strictInterface({
	isFocused = t.boolean,
	didFocus = t.optional(t.callback),
	didBlur = t.optional(t.callback),
	shouldForgetPreviousSelection = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.boolean) or nil,
	currentHandlerId = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.number) or nil,
	candidateHandlerId = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.number) or nil,
	previousSelections = if getFFlagIGMGamepadSelectionHistoryModule() then t.table else nil,
	requestFocusForHandlerId = if getFFlagIGMGamepadSelectionHistoryModule() then t.callback else nil,
	forgetLastSelectionForHandlerId = if getFFlagIGMGamepadSelectionHistoryModule() then t.callback else nil,
	blurCurrentFocusHandler = if getFFlagIGMGamepadSelectionHistoryModule() then t.callback else nil,
	[roact.Children] = t.optional(t.table)
})

if getFFlagIGMGamepadSelectionHistoryModule() then
	function focusHandler.init(p1)
		-- upvalues: var1 (write)
		p1.id = var1
		var1 += 1
	end
end
function focusHandler.render(p1)
	-- upvalues: roact (ref)
	return roact.createFragment(p1.props[roact.Children])
end

if getFFlagIGMGamepadSelectionHistoryModule() then
	function focusHandler.didMount(p1)
		if p1.props.isFocused then
			p1.props.requestFocusForHandlerId(p1.id)
		end
	end
else
	function focusHandler.didMount(p1)
		if p1.props.isFocused then
			p1.props.didFocus()
		end
	end
end
if getFFlagIGMGamepadSelectionHistoryModule() then
	function focusHandler.didUpdate(p1, p2)
		local id = p1.props.previousSelections[p1.id]
		
		if p1.props.shouldForgetPreviousSelection and not p2.shouldForgetPreviousSelection or id ~= nil and not id:IsDescendantOf(game) then
			p1.props.forgetLastSelectionForHandlerId(p1.id)
			id = nil
		end
		local var2 = p1.props.candidateHandlerId ~= p1.id and p1.props.candidateHandlerId ~= nil
		local var3 = p2.candidateHandlerId ~= p1.id and p2.candidateHandlerId ~= nil
		local var4 = p1.props.currentHandlerId == p1.id and p2.currentHandlerId ~= p1.id
		local isFocused = (p1.props.currentHandlerId == nil and (p2.currentHandlerId ~= nil and p2.currentHandlerId ~= p1.id)) and (not var2 and p1.props.isFocused)
		local isFocused_1 = not p2.isFocused and p1.props.isFocused
		local var5 = if p2.isFocused then not p1.props.isFocused else var2 and not var3
		local var6 = p2.currentHandlerId == p1.id and p1.props.currentHandlerId ~= p1.id
		
		if isFocused_1 or isFocused then
			p1.props.requestFocusForHandlerId(p1.id)
		elseif var4 and p1.props.didFocus then
			p1.props.didFocus(id)
		end
		if var5 and p1.props.currentHandlerId == p1.id then
			p1.props.blurCurrentFocusHandler(p1.id, p1.props.shouldForgetPreviousSelection)
		end
		if var6 and p1.props.didBlur then
			p1.props.didBlur()
		end
	end
else
	function focusHandler.didUpdate(p1, p2)
		if p1.props.isFocused and not p2.isFocused and p1.props.didFocus then
			p1.props.didFocus()
			
			return
		elseif not p1.props.isFocused and p2.isFocused and p1.props.didBlur then
			p1.props.didBlur()
		end
	end
end
if getFFlagIGMGamepadSelectionHistoryModule() then
	function focusHandler.willUnmount(p1)
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
	function focusHandler.willUnmount(p1)
		if p1.props.isFocused and p1.props.didBlur then
			p1.props.didBlur()
		end
	end
end
return if getFFlagIGMGamepadSelectionHistoryModule() then function(p1)
	-- upvalues: roact (ref), focusHandlerContextModule (ref), focusHandler (ref), cryo (ref)
	return roact.createElement(focusHandlerContextModule.Consumer, {
		render = function(p2)
			-- upvalues: roact (copy), focusHandler (copy), cryo (copy), p1 (ref)
			return roact.createElement(focusHandler, cryo.Dictionary.join(p1, {
				currentHandlerId = p2.currentHandlerId,
				previousSelections = p2.previousSelections,
				requestFocusForHandlerId = p2.requestFocusForHandlerId,
				forgetLastSelectionForHandlerId = p2.forgetLastSelectionForHandlerId,
				blurCurrentFocusHandler = p2.blurCurrentFocusHandler,
				candidateHandlerId = p2.candidateHandlerId
			}))
		end
	})
end else focusHandler
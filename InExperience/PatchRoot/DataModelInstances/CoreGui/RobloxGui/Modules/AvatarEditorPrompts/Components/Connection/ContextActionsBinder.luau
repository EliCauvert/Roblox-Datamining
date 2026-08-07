local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local closeOpenPromptModule = require(script.Parent.Parent.Parent.Thunks.CloseOpenPrompt)
local contextActionsBinder = roactModule.PureComponent:extend("ContextActionsBinder")
contextActionsBinder.validateProps = tModule.strictInterface({
	promptOpen = tModule.boolean,
	closeOpenPrompt = tModule.callback
})

function contextActionsBinder.init(p0) --[[ line: 27 ]]
	p0.actionsBound = false
end

function contextActionsBinder.bindActions(p1) --[[ line: 31 ]]
	-- upvalues: contextActionService (ref), guiService (ref)
	if p1.actionsBound then
		return
	end
	p1.actionsBound = true
	contextActionService:BindCoreAction("CloseAvatarEditorPrompt", function(_, p2, _) --[[ line: 38 ]]
		-- upvalues: guiService (copy), p1 (ref)
		if guiService.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		elseif p2 == Enum.UserInputState.Begin then
			p1.props.closeOpenPrompt()
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.Escape)
end

function contextActionsBinder.unbindActions(p3) --[[ line: 51 ]]
	-- upvalues: contextActionService (ref)
	if p3.actionsBound then
		p3.actionsBound = false
		contextActionService:UnbindCoreAction("CloseAvatarEditorPrompt")
		
		return
	end
end

function contextActionsBinder.didMount(p4) --[[ line: 61 ]]
	if p4.props.promptOpen then
		p4:bindActions()
	end
end

function contextActionsBinder.render(_) --[[ line: 67 ]]
	return nil
end

function contextActionsBinder.didUpdate(p5, p6, _) --[[ line: 71 ]]
	if p5.props.promptOpen ~= p6.promptOpen then
		if p5.props.promptOpen then
			p5:bindActions()
			
			return
		end
		p5:unbindActions()
	end
end

function contextActionsBinder.willUnmount(p7) --[[ line: 81 ]]
	if p7.actionsBound then
		p7:unbindActions()
	end
end

return roactRoduxModule.connect(function(p8) --[[ line: 87 | named "mapStateToProps" ]]
	return { promptOpen = p8.promptInfo.promptType ~= nil }
end, function(p9) --[[ line: 93 | named "mapDispatchToProps" ]]
	-- upvalues: closeOpenPromptModule (ref)
	return {
		closeOpenPrompt = function() --[[ line: 95 ]]
			-- upvalues: p9 (ref), closeOpenPromptModule (copy)
			return p9(closeOpenPromptModule)
		end
	}
end)(contextActionsBinder)
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

function contextActionsBinder.init(p1)
	p1.actionsBound = false
end

function contextActionsBinder.bindActions(p1)
	-- upvalues: contextActionService (ref), guiService (ref)
	if p1.actionsBound then
		return
	end
	p1.actionsBound = true
	contextActionService:BindCoreAction("CloseAvatarEditorPrompt", function(_, p2, _)
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

function contextActionsBinder.unbindActions(p1)
	-- upvalues: contextActionService (ref)
	if p1.actionsBound then
		p1.actionsBound = false
		contextActionService:UnbindCoreAction("CloseAvatarEditorPrompt")
		
		return
	end
end

function contextActionsBinder.didMount(p1)
	if p1.props.promptOpen then
		p1:bindActions()
	end
end

function contextActionsBinder.render(_)
	return nil
end

function contextActionsBinder.didUpdate(p1, p2, _)
	if p1.props.promptOpen ~= p2.promptOpen then
		if p1.props.promptOpen then
			p1:bindActions()
			
			return
		end
		p1:unbindActions()
	end
end

function contextActionsBinder.willUnmount(p1)
	if p1.actionsBound then
		p1:unbindActions()
	end
end

return roactRoduxModule.connect(function(p1)
	return { promptOpen = p1.promptInfo.promptType ~= nil }
end, function(p1)
	-- upvalues: closeOpenPromptModule (ref)
	return {
		closeOpenPrompt = function()
			-- upvalues: p1 (ref), closeOpenPromptModule (copy)
			return p1(closeOpenPromptModule)
		end
	}
end)(contextActionsBinder)
local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local CloseOpenPromptModule = require(script.Parent.Parent.Parent.Thunks.CloseOpenPrompt)
local ContextActionsBinder = require(CorePackages.Packages.Roact).PureComponent:extend("ContextActionsBinder")
ContextActionsBinder.validateProps = TModule.strictInterface({
	promptOpen = TModule.boolean,
	closeOpenPrompt = TModule.callback
})

function ContextActionsBinder.init(p1) --[[ Line: 27 ]]
	p1.actionsBound = false
end

function ContextActionsBinder.bindActions(p1) --[[ Line: 31 ]]
	-- upvalues: ContextActionService (copy), GuiService (copy)
	if not p1.actionsBound then
		p1.actionsBound = true
		ContextActionService:BindCoreAction("CloseAvatarEditorPrompt", function(_, UserInputState, _) --[[ Line: 38 ]]
			-- upvalues: GuiService (upval), p1 (copy)
			if GuiService.MenuIsOpen then
				return Enum.ContextActionResult.Pass
			elseif UserInputState == Enum.UserInputState.Begin then
				p1.props.closeOpenPrompt()
				
				return Enum.ContextActionResult.Sink
			else
				return Enum.ContextActionResult.Pass
			end
		end, false, Enum.KeyCode.Escape)
		
		return
	end
end

function ContextActionsBinder.unbindActions(p1) --[[ Line: 51 ]]
	-- upvalues: ContextActionService (copy)
	if p1.actionsBound then
		p1.actionsBound = false
		ContextActionService:UnbindCoreAction("CloseAvatarEditorPrompt")
		
		return
	end
end

function ContextActionsBinder.didMount(p1) --[[ Line: 61 ]]
	if p1.props.promptOpen then
		p1:bindActions()
	end
end

function ContextActionsBinder:render() --[[ Line: 67 ]]
	return nil
end

function ContextActionsBinder.didUpdate(p1, p2, _) --[[ Line: 71 ]]
	if p1.props.promptOpen ~= p2.promptOpen then
		if p1.props.promptOpen then
			p1:bindActions()
			
			return
		end
		p1:unbindActions()
	end
end

function ContextActionsBinder.willUnmount(p1) --[[ Line: 81 ]]
	if p1.actionsBound then
		p1:unbindActions()
	end
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 87 | Named "mapStateToProps" ]]
	return { promptOpen = p1.promptInfo.promptType ~= nil }
end, function(Callback) --[[ Line: 93 | Named "mapDispatchToProps" ]]
	-- upvalues: CloseOpenPromptModule (copy)
	return {
		closeOpenPrompt = function() --[[ Line: 95 ]]
			-- upvalues: Callback (copy), CloseOpenPromptModule (upval)
			return Callback(CloseOpenPromptModule)
		end
	}
end)(ContextActionsBinder)
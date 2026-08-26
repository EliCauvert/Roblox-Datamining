local guiService = game:GetService("GuiService")
local roact = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact
local focusHandlerContextModule = require(script.Parent.FocusHandlerContext)
local focusHandlerContextProvider = roact.PureComponent:extend("FocusHandlerContextProvider")

function focusHandlerContextProvider.init(p1)
	p1.state = { candidateHandlerId = nil, currentHandlerId = nil }
	p1.previousSelections = {}
end

function focusHandlerContextProvider.requestFocusForHandlerId(p1, p2)
	p1:setState(function(p3)
		-- upvalues: p2 (ref)
		return if p3.currentHandlerId == nil then { currentHandlerId = p2 } elseif p2 == p3.currentHandlerId then nil else { candidateHandlerId = p2 }
	end)
end

function focusHandlerContextProvider.blurCurrentFocusHandler(p1, p2, p3)
	-- upvalues: guiService (ref), roact (ref)
	p1:setState(function(p4)
		-- upvalues: p2 (ref), p3 (ref), guiService (copy), p1 (ref), roact (copy)
		if p4.currentHandlerId ~= p2 then
			return nil
		end
		p1.previousSelections[p2] = if not p3 then guiService.SelectedCoreObject else nil
		local _ = nil
		
		return if p4.candidateHandlerId == nil then { currentHandlerId = roact.None } else {
			currentHandlerId = p4.candidateHandlerId,
			candidateHandlerId = roact.None
		}
	end)
end

function focusHandlerContextProvider.forgetLastSelectionForHandlerId(p1, p2)
	p1.previousSelections[p2] = nil
end

function focusHandlerContextProvider.render(p1)
	-- upvalues: roact (ref), focusHandlerContextModule (ref)
	return roact.createElement(focusHandlerContextModule.Provider, {
		value = {
			currentHandlerId = p1.state.currentHandlerId,
			candidateHandlerId = p1.state.candidateHandlerId,
			previousSelections = p1.previousSelections,
			requestFocusForHandlerId = function(p2)
				-- upvalues: p1 (ref)
				p1:requestFocusForHandlerId(p2)
			end,
			forgetLastSelectionForHandlerId = function(p2)
				-- upvalues: p1 (ref)
				p1:forgetLastSelectionForHandlerId(p2)
			end,
			blurCurrentFocusHandler = function(p2, p3)
				-- upvalues: p1 (ref)
				p1:blurCurrentFocusHandler(p2, p3)
			end
		}
	}, p1.props[roact.Children])
end

return focusHandlerContextProvider
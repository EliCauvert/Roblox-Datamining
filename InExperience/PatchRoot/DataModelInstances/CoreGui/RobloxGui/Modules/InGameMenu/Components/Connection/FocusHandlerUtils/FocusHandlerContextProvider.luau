local guiService = game:GetService("GuiService")
local roact = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact
local focusHandlerContextModule = require(script.Parent.FocusHandlerContext)
local focusHandlerContextProvider = roact.PureComponent:extend("FocusHandlerContextProvider")

function focusHandlerContextProvider.init(p0) --[[ line: 17 ]]
	p0.state = { candidateHandlerId = nil, currentHandlerId = nil }
	p0.previousSelections = {}
end

function focusHandlerContextProvider.requestFocusForHandlerId(p1, p2) --[[ line: 25 ]]
	p1:setState(function(p3) --[[ line: 26 ]]
		-- upvalues: p2 (ref)
		return if p3.currentHandlerId == nil then { currentHandlerId = p2 } elseif p2 == p3.currentHandlerId then nil else { candidateHandlerId = p2 }
	end)
end

function focusHandlerContextProvider.blurCurrentFocusHandler(p4, p5, p6) --[[ line: 41 ]]
	-- upvalues: guiService (ref), roact (ref)
	p4:setState(function(p7) --[[ line: 42 ]]
		-- upvalues: p5 (ref), p6 (ref), guiService (copy), p4 (ref), roact (copy)
		if p7.currentHandlerId ~= p5 then
			return nil
		end
		p4.previousSelections[p5] = if not p6 then guiService.SelectedCoreObject else nil
		local _ = nil
		
		return if p7.candidateHandlerId == nil then { currentHandlerId = roact.None } else {
			currentHandlerId = p7.candidateHandlerId,
			candidateHandlerId = roact.None
		}
	end)
end

function focusHandlerContextProvider.forgetLastSelectionForHandlerId(p8, p9) --[[ line: 67 ]]
	p8.previousSelections[p9] = nil
end

function focusHandlerContextProvider.render(p10) --[[ line: 71 ]]
	-- upvalues: roact (ref), focusHandlerContextModule (ref)
	return roact.createElement(focusHandlerContextModule.Provider, {
		value = {
			currentHandlerId = p10.state.currentHandlerId,
			candidateHandlerId = p10.state.candidateHandlerId,
			previousSelections = p10.previousSelections,
			requestFocusForHandlerId = function(p11) --[[ line: 77 ]]
				-- upvalues: p10 (ref)
				p10:requestFocusForHandlerId(p11)
			end,
			forgetLastSelectionForHandlerId = function(p12) --[[ line: 80 ]]
				-- upvalues: p10 (ref)
				p10:forgetLastSelectionForHandlerId(p12)
			end,
			blurCurrentFocusHandler = function(p13, p14) --[[ line: 83 ]]
				-- upvalues: p10 (ref)
				p10:blurCurrentFocusHandler(p13, p14)
			end
		}
	}, p10.props[roact.Children])
end

return focusHandlerContextProvider
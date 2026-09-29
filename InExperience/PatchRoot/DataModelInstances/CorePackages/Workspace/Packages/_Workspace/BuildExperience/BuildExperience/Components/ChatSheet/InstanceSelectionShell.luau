local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local clientDataModelCollectorModule = require(buildExperience.Chat.clientDataModelCollector)
local inGameBuildShellModule = require(script.Parent.InGameBuildShell)
local instanceSelectionProtocolModule = require(script.Parent.InstanceSelectionProtocol)

local function noop() end

local function _(p1)
	-- upvalues: instanceSelectionProtocolModule (ref), clientDataModelCollectorModule (ref)
	instanceSelectionProtocolModule.finishSelection({
		status = "selected",
		path = clientDataModelCollectorModule.getInstancePath(p1),
		displayName = p1.Name,
		className = p1.ClassName
	})
end

local function cancelSelection()
	-- upvalues: instanceSelectionProtocolModule (ref)
	instanceSelectionProtocolModule.finishSelection({ status = "cancelled" })
end

return function(p1)
	-- upvalues: reactModule (ref), instanceSelectionProtocolModule (ref), clientDataModelCollectorModule (ref), inGameBuildShellModule (ref), noop (ref), cancelSelection (ref)
	local var1, var2 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), instanceSelectionProtocolModule (copy), clientDataModelCollectorModule (copy)
		local itemSelectedConnection = p1.itemSelected:Connect(function(p2)
			-- upvalues: p1 (copy), var2 (copy), instanceSelectionProtocolModule (copy), clientDataModelCollectorModule (copy)
			if p1.isTouchInput() then
				var2(p2)
				
				return
			elseif p2 ~= nil then
				instanceSelectionProtocolModule.finishSelection({
					status = "selected",
					path = clientDataModelCollectorModule.getInstancePath(p2),
					displayName = p2.Name,
					className = p2.ClassName
				})
			end
		end)
		
		return function()
			-- upvalues: itemSelectedConnection (ref)
			itemSelectedConnection:Disconnect()
		end
	end, { p1.itemSelected, p1.isTouchInput })
	
	return reactModule.createElement(inGameBuildShellModule, {
		isSelecting = true,
		onActivated = noop,
		onSelectionCancelled = cancelSelection,
		onSelectionConfirmed = if var1 ~= nil then nil else function()
			-- upvalues: var1 (ref), instanceSelectionProtocolModule (copy), clientDataModelCollectorModule (copy)
			instanceSelectionProtocolModule.finishSelection({
				status = "selected",
				path = clientDataModelCollectorModule.getInstancePath(var1),
				displayName = var1.Name,
				className = var1.ClassName
			})
		end
	})
end
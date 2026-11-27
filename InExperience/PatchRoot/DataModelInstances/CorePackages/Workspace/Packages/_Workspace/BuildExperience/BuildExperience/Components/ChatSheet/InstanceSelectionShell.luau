local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local ClientDataModelCollectorModule = require(BuildExperience.Chat.clientDataModelCollector)
local InGameBuildShellModule = require(script.Parent.InGameBuildShell)
local InstanceSelectionProtocolModule = require(script.Parent.InstanceSelectionProtocol)

local function noop() end

local function _(p1)
	-- upvalues: InstanceSelectionProtocolModule (copy), ClientDataModelCollectorModule (copy)
	InstanceSelectionProtocolModule.finishSelection({
		status = "selected",
		path = ClientDataModelCollectorModule.getInstancePath(p1),
		displayName = p1.Name,
		className = p1.ClassName
	})
end

local function cancelSelection()
	-- upvalues: InstanceSelectionProtocolModule (copy)
	InstanceSelectionProtocolModule.finishSelection({ status = "cancelled" })
end

return function(p1)
	-- upvalues: ReactModule (copy), InstanceSelectionProtocolModule (copy), ClientDataModelCollectorModule (copy), InGameBuildShellModule (copy), noop (copy), cancelSelection (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), InstanceSelectionProtocolModule (upval), ClientDataModelCollectorModule (upval)
		local ItemSelectedConnection = p1.itemSelected:Connect(function(p2)
			-- upvalues: p1 (upval), UseStateResult2 (upval), InstanceSelectionProtocolModule (upval), ClientDataModelCollectorModule (upval)
			if p1.isTouchInput() then
				UseStateResult2(p2)
				
				return
			end
			if p2 ~= nil then
				InstanceSelectionProtocolModule.finishSelection({
					status = "selected",
					path = ClientDataModelCollectorModule.getInstancePath(p2),
					displayName = p2.Name,
					className = p2.ClassName
				})
			end
		end)
		
		return function()
			-- upvalues: ItemSelectedConnection (copy)
			ItemSelectedConnection:Disconnect()
		end
	end, { p1.itemSelected, p1.isTouchInput })
	
	return ReactModule.createElement(InGameBuildShellModule, {
		isSelecting = true,
		onActivated = noop,
		onSelectionCancelled = cancelSelection,
		onSelectionConfirmed = if UseStateResult == nil then nil else function()
			-- upvalues: UseStateResult (copy), InstanceSelectionProtocolModule (upval), ClientDataModelCollectorModule (upval)
			InstanceSelectionProtocolModule.finishSelection({
				status = "selected",
				path = ClientDataModelCollectorModule.getInstancePath(UseStateResult),
				displayName = UseStateResult.Name,
				className = UseStateResult.ClassName
			})
		end
	})
end
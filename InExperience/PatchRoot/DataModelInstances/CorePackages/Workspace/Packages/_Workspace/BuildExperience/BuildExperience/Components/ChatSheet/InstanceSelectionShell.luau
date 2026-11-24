local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FFlagBuildExperienceInGameShellComposer = require(Parent.SharedFlags).FFlagBuildExperienceInGameShellComposer
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
	-- upvalues: FFlagBuildExperienceInGameShellComposer (copy), ReactModule (copy), InstanceSelectionProtocolModule (copy), ClientDataModelCollectorModule (copy), InGameBuildShellModule (copy), noop (copy), cancelSelection (copy)
	if FFlagBuildExperienceInGameShellComposer then
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), InstanceSelectionProtocolModule (upval), ClientDataModelCollectorModule (upval), UseRefResult (copy)
			local Largest = 0
			local List = {
				p1.itemSelected:Connect(function(Current)
					-- upvalues: p1 (upval), Largest (ref), InstanceSelectionProtocolModule (upval), ClientDataModelCollectorModule (upval), UseRefResult (upval)
					if p1.isTouchInput() and Largest ~= 0 then
						UseRefResult.current = Current
						
						return
					end
					if Current ~= nil then
						InstanceSelectionProtocolModule.finishSelection({
							status = "selected",
							path = ClientDataModelCollectorModule.getInstancePath(Current),
							displayName = Current.Name,
							className = Current.ClassName
						})
					end
				end)
			}
			
			if p1.touchStarted ~= nil then
				table.insert(List, p1.touchStarted:Connect(function()
					-- upvalues: Largest (ref)
					Largest += 1
				end))
			end
			if p1.touchEnded ~= nil then
				table.insert(List, p1.touchEnded:Connect(function()
					-- upvalues: Largest (ref), UseRefResult (upval), InstanceSelectionProtocolModule (upval), ClientDataModelCollectorModule (upval)
					Largest = math.max(Largest - 1, 0)
					local Current = UseRefResult.current
					
					if Largest == 0 and Current ~= nil then
						UseRefResult.current = nil
						InstanceSelectionProtocolModule.finishSelection({
							status = "selected",
							path = ClientDataModelCollectorModule.getInstancePath(Current),
							displayName = Current.Name,
							className = Current.ClassName
						})
					end
				end))
			end
			return function()
				-- upvalues: List (copy)
				for _, Connection in List do
					Connection:Disconnect()
				end
			end
		end, {
			p1.itemSelected,
			p1.isTouchInput,
			p1.touchStarted,
			p1.touchEnded
		})
		
		return ReactModule.createElement(InGameBuildShellModule, {
			isSelecting = true,
			onActivated = noop,
			onSelectionCancelled = cancelSelection
		})
	else
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
end
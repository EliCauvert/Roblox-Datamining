local serverCoreScriptSourceCode = game:DefineFastFlag("ServerCoreScriptSourceCode", false)
local t = {
	getFFlagServerCoreScriptSourceCode = function()
		-- upvalues: serverCoreScriptSourceCode (ref)
		return serverCoreScriptSourceCode
	end
}

if serverCoreScriptSourceCode then
	local insertService = game:GetService("InsertService")
	local modules = game:GetService("CoreGui"):WaitForChild("RobloxGui", 1e999).Modules
	
	local function getRelativePathArray(p1, p2)
		local t = {}
		while p2 ~= p1 do
			if p2 ~= nil then
				table.insert(t, 1, p2.Name)
				p2 = p2.Parent
				continue
			end
			return nil
		end
		return t
	end
	
	function t.getSourceForServerScript(p3)
		-- upvalues: modules (ref), getRelativePathArray (ref)
		if p3.Source ~= "" then
			return p3.Source
		end
		local sourceCode = modules.SourceCode
		local var1 = getRelativePathArray(modules, p3)
		
		if var1 == nil then
			error("Instance is not a descendant of the byte code root")
		end
		local var2 = sourceCode
		
		for i = 1, #var1 do
			var2 = var2:FindFirstChild(var1[i])
		end
		if var2 == nil then
			error("No source found for instance")
		end
		return var2.Source
	end
	
	local function _()
		return script.Source == ""
	end
	
	function t.initSourceCodeFolder()
		-- upvalues: insertService (ref), modules (ref)
		if script.Source == "" then
			local var3 = insertService:LoadLocalAsset("rbxasset://models/ServerCoreScripts.rbxm")
			local sourceCode = Instance.new("Folder")
			sourceCode.Name = "SourceCode"
			sourceCode.Parent = modules
			local common = var3.Common
			var3.Server.Parent = sourceCode
			common.Parent = sourceCode
			
			return
		end
	end
end
return t
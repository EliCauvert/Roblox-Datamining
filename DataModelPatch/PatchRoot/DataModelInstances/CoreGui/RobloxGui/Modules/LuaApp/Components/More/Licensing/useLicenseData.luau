local CorePackages = game:GetService("CorePackages")
local InsertService = game:GetService("InsertService")
local ReactModule = require(CorePackages.Packages.React)
local PromiseModule = require(CorePackages.Packages.Promise)

local function _()
	-- upvalues: PromiseModule (copy), InsertService (copy)
	return PromiseModule.new(function(Callback, Callback1)
		-- upvalues: InsertService (upval)
		task.spawn(function()
			-- upvalues: InsertService (upval), Callback (copy), Callback1 (copy)
			local Success, Result = pcall(function()
				-- upvalues: InsertService (upval)
				local t = {}
				
				for _, child in pairs(InsertService:LoadLocalAsset("rbxasset://models/Licenses/Licenses.rbxm"):FindFirstChild("CoreScripts"):GetChildren()) do
					local D, D2 = child.Name:match("^(%d*)-(.*)")
					t[D + 1] = {
						key = D2,
						value = child.Value:match("(.-)\n*$"):split("\n")
					}
				end
				return t
			end)
			
			if Success then
				Callback(Result)
				
				return
			else
				Callback1(Result)
			end
		end)
	end)
end

return function()
	-- upvalues: ReactModule (copy), PromiseModule (copy), InsertService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		initialLicense = nil,
		initialLicenseKey = nil,
		licenseList = {}
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: PromiseModule (upval), InsertService (upval), UseStateResult2 (copy)
		PromiseModule.new(function(Callback, Callback1)
			-- upvalues: InsertService (upval)
			task.spawn(function()
				-- upvalues: InsertService (upval), Callback (copy), Callback1 (copy)
				local Success, Result = pcall(function()
					-- upvalues: InsertService (upval)
					local t = {}
					
					for _, child in pairs(InsertService:LoadLocalAsset("rbxasset://models/Licenses/Licenses.rbxm"):FindFirstChild("CoreScripts"):GetChildren()) do
						local D, D2 = child.Name:match("^(%d*)-(.*)")
						t[D + 1] = {
							key = D2,
							value = child.Value:match("(.-)\n*$"):split("\n")
						}
					end
					return t
				end)
				
				if Success then
					Callback(Result)
					
					return
				else
					Callback1(Result)
				end
			end)
		end):andThen(function(Entry)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2({
				licenseList = Entry,
				initialLicense = Entry[1],
				initialLicenseKey = if Entry[1] then Entry[1].key else nil
			})
		end):catch(function(Err)
			warn("Failed to retrieve license data: ", Err)
		end)
	end, {})
	
	return UseStateResult
end
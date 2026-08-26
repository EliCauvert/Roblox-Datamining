local userLib = script:FindFirstAncestor("UserLib")
local parent = userLib.Parent
local cryoModule = require(parent.Cryo)
local promiseUtilities = require(parent.AppCommonLib).Utils.PromiseUtilities
local _ = require(userLib.Utils)
local promiseModule = require(parent.Promise)
local constantsModule = require(userLib.Utils.Constants)
local getRbxthumbWithTypeSizeAndOptions = require(userLib.Utils).getRbxthumbWithTypeSizeAndOptions

local function subdivideEntries(p1, p2)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i = 1, #p1, p2 do
		table.insert(t, cryoModule.List.getRange(p1, i, i + p2 - 1))
	end
	return t
end

local function _(p3, p4, p5)
	-- upvalues: promiseModule (ref), constantsModule (ref), getRbxthumbWithTypeSizeAndOptions (ref)
	return promiseModule.new(function(p6, _)
		-- upvalues: p3 (ref), p4 (ref), constantsModule (copy), getRbxthumbWithTypeSizeAndOptions (copy), p5 (ref)
		local t = {}
		local t_1 = {}
		
		for i, v in p3 do
			t_1[v] = {}
			
			for i_1, v_1 in p4 do
				t_1[v][v_1.thumbnailType] = t_1[v][v_1.thumbnailType] or {}
				local var1 = getRbxthumbWithTypeSizeAndOptions(v, constantsModule.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v_1.thumbnailType], constantsModule.RbxThumbnailSizeToNumberSize[v_1.thumbnailSize])
				t_1[v][v_1.thumbnailType][v_1.thumbnailSize] = var1
				table.insert(t, var1)
			end
		end;
		(p5 or game:GetService("ContentProvider")):PreloadAsync(t)
		p6()
	end)
end

return function(p7, p8, p9)
	-- upvalues: subdivideEntries (ref), promiseModule (ref), constantsModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), promiseUtilities (ref)
	return function(_)
		-- upvalues: subdivideEntries (copy), p7 (ref), p8 (ref), p9 (ref), promiseModule (copy), constantsModule (copy), getRbxthumbWithTypeSizeAndOptions (copy), promiseUtilities (copy)
		local t = {}
		
		for i, v in pairs(subdivideEntries(p7, 100)) do
			table.insert(t, promiseModule.new(function(p10, _)
				-- upvalues: v (ref), p8 (ref), constantsModule (copy), getRbxthumbWithTypeSizeAndOptions (copy), p9 (ref)
				local t = {}
				local t_1 = {}
				
				for i, v in v do
					t_1[v] = {}
					
					for i_1, v_1 in p8 do
						t_1[v][v_1.thumbnailType] = t_1[v][v_1.thumbnailType] or {}
						local var2 = getRbxthumbWithTypeSizeAndOptions(v, constantsModule.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v_1.thumbnailType], constantsModule.RbxThumbnailSizeToNumberSize[v_1.thumbnailSize])
						t_1[v][v_1.thumbnailType][v_1.thumbnailSize] = var2
						table.insert(t, var2)
					end
				end;
				(p9 or game:GetService("ContentProvider")):PreloadAsync(t)
				p10()
			end))
		end
		return promiseUtilities.Batch(t)
	end
end
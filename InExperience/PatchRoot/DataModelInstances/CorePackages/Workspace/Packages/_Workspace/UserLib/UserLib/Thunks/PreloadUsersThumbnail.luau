local userLib = script:FindFirstAncestor("UserLib")
local parent = userLib.Parent
local cryoModule = require(parent.Cryo)
local promiseUtilities = require(parent.AppCommonLib).Utils.PromiseUtilities
local _ = require(userLib.Utils)
local promiseModule = require(parent.Promise)
local constantsModule = require(userLib.Utils.Constants)
local getRbxthumbWithTypeSizeAndOptions = require(userLib.Utils).getRbxthumbWithTypeSizeAndOptions

local function subdivideEntries(p0, p1)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i = 1, #p0, p1 do
		table.insert(t, cryoModule.List.getRange(p0, i, i + p1 - 1))
	end
	return t
end

local function _(p2, p3, p4)
	-- upvalues: promiseModule (ref), constantsModule (ref), getRbxthumbWithTypeSizeAndOptions (ref)
	return promiseModule.new(function(p5, _)
		-- upvalues: p2 (ref), p3 (ref), constantsModule (copy), getRbxthumbWithTypeSizeAndOptions (copy), p4 (ref)
		local t = {}
		local t_1 = {}
		
		for i, v in p2 do
			t_1[v] = {}
			
			for i_1, v_1 in p3 do
				t_1[v][v_1.thumbnailType] = t_1[v][v_1.thumbnailType] or {}
				local var8 = getRbxthumbWithTypeSizeAndOptions(v, constantsModule.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v_1.thumbnailType], constantsModule.RbxThumbnailSizeToNumberSize[v_1.thumbnailSize])
				t_1[v][v_1.thumbnailType][v_1.thumbnailSize] = var8
				table.insert(t, var8)
			end
		end;
		(p4 or game:GetService("ContentProvider")):PreloadAsync(t)
		p5()
	end)
end

return function(p6, p7, p8)
	-- upvalues: subdivideEntries (ref), promiseModule (ref), constantsModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), promiseUtilities (ref)
	return function(_)
		-- upvalues: subdivideEntries (copy), p6 (ref), p7 (ref), p8 (ref), promiseModule (copy), constantsModule (copy), getRbxthumbWithTypeSizeAndOptions (copy), promiseUtilities (copy)
		local t = {}
		
		for i, v in pairs(subdivideEntries(p6, 100)) do
			table.insert(t, promiseModule.new(function(p9, _)
				-- upvalues: v (ref), p7 (ref), constantsModule (copy), getRbxthumbWithTypeSizeAndOptions (copy), p8 (ref)
				local t = {}
				local t_1 = {}
				
				for i, v in v do
					t_1[v] = {}
					
					for i_1, v_1 in p7 do
						t_1[v][v_1.thumbnailType] = t_1[v][v_1.thumbnailType] or {}
						local var8 = getRbxthumbWithTypeSizeAndOptions(v, constantsModule.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v_1.thumbnailType], constantsModule.RbxThumbnailSizeToNumberSize[v_1.thumbnailSize])
						t_1[v][v_1.thumbnailType][v_1.thumbnailSize] = var8
						table.insert(t, var8)
					end
				end;
				(p8 or game:GetService("ContentProvider")):PreloadAsync(t)
				p9()
			end))
		end
		return promiseUtilities.Batch(t)
	end
end
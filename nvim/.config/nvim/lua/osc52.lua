local M = {}

-- base64 кодирование для OSC52
local b64 = function(data)
  local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
  return ((data:gsub('.', function(x)
    local r,byte='',x:byte()
    for i=8,1,-1 do r = r .. (byte%2^i - byte%2^(i-1) > 0 and '1' or '0') end
    return r
  end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
    if #x < 6 then return '' end
    local c=0
    for i=1,6 do c=c + (x:sub(i,i)=='1' and 2^(6-i) or 0) end
    return b:sub(c+1,c+1)
  end)..({ '', '==', '=' })[#data%3+1])
end

local function osc52_copy(text)
  local osc52 = "\x1b]52;c;" .. b64(text) .. "\x07"
  io.stdout:write(osc52)
  io.stdout:flush()
end

function M.copy(lines, _)
  osc52_copy(table.concat(lines, "\n"))
end

function M.paste()
  return {}, false  -- OSC52 не умеет вставлять обратно
end

return M

# parse_code.py
with open('raw_code.bin', 'rb') as f:
    data = f.read()

inst_lengths = {
    0x0: 2, 0x2: 2, 0x4: 2, 0x6: 2, 0x8: 2, 0xa: 4, 
    0xe: 2, 0x10: 2, 0x12: 2, 0x14: 2, 0x16: 2, 0x18: 2
}

# --- PASS 1: ONLY BINARY ---
print('=== BINARY MACHINE CODE ===')
offset = 0
while offset < len(data):
    length = inst_lengths.get(offset, 2)
    chunk = data[offset:offset+length]
    if len(chunk) == length:
        bits = ''.join(f'{b:08b}' for b in reversed(chunk))
        print(f'Offset 0x{offset:<3x}: {bits:>32}')
    offset += length

print('\n' + '='*45 + '\n')

# --- PASS 2: ONLY HEX ---
print('=== HEXADECIMAL MACHINE CODE ===')
offset = 0
while offset < len(data):
    length = inst_lengths.get(offset, 2)
    chunk = data[offset:offset+length]
    if len(chunk) == length:
        hex_str = ''.join(f'{b:02x}' for b in reversed(chunk))
        print(f'Offset 0x{offset:<3x}: {hex_str:>8}')
    offset += length

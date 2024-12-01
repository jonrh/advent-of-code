export async function readTextFile(path: string): Promise<string> {
  const decoder = new TextDecoder("utf-8");
  const data = await Deno.readFile(path);
  return decoder.decode(data).trim();
}
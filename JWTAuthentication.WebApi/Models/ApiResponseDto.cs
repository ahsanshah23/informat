namespace com.Informat.WebAPI.Models
{
    public class ApiResponseDto
    {
        public int Count { get; set; }
        public int Status_Code { get; set; }
        public string Message { get; set; }
        public object Data { get; set; }
    }
}
